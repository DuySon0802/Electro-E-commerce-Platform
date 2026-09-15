<%@ page import="com.linh.web.repository.ProductRepository" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <c:set var="pageTitle" value="Electro. - Mua Sắm"/>

    <%@include file="../commons/head.jsp" %>

</head>
<body>
<!-- HEADER -->
<%@ include file="../commons/header.jsp" %>

<!-- /HEADER -->

<!-- NAVIGATION -->
<jsp:include page="../commons/navigation.jsp"/>

<!-- /NAVIGATION -->

    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- ASIDE -->
            <div id="aside" class="col-md-3">
                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Phân loại</h3>
                    <form method="get" action="shop" id="categoryFilterForm">
                        <div class="checkbox-filter">

                            <c:forEach var="category" items="${categories}">
                                <div class="input-checkbox">
                                    <input type="checkbox" id="${category.key}" name="category"
                                           value="${category.key}"
                                           onChange="updateFilterURL()" ${selectedCategories.contains(category.key) ? 'checked' : ''}>
                                    <label for="${category.key}">
                                        <span></span>
                                            ${category.value}
                                    </label>
                                </div>
                            </c:forEach>

                        </div>
                    </form>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Giá</h3>
                    <form action="shop" method="get" id="priceFilter">
                        <div class="price-filter">
                            <div id="price-slider"
                                 data-range-min="1"
                                 data-range-max="149999999"
                                 data-selected-min="${filterMinPrice != null ? filterMinPrice : 1}"
                                 data-selected-max="${filterMaxPrice != null ? filterMaxPrice : 149999999}"></div>
                            <div class="input-number price-min">
                                <input id="price-min" type="number" inputmode="numeric" name="minPrice" onchange="updateFilterURL()"
                                       value="${filterMinPrice != null ? filterMinPrice : ''}"
                                       placeholder="${filterMinPrice != null ? filterMinPrice : 1}">
                                <%--                            <span class="qty-up">+</span>--%>
                                <%--                            <span class="qty-down">-</span>--%>
                            </div>

                            <span>-</span>
                            <div class="input-number price-max">
                                <input id="price-max" type="number" inputmode="numeric" name="maxPrice" onChange="updateFilterURL()"
                                       value="${filterMaxPrice != null ? filterMaxPrice : ''}"
                                       placeholder="${filterMaxPrice != null ? filterMaxPrice : 149999999}">
                                <%--                            <span class="qty-up">+</span>--%>
                                <%--                            <span class="qty-down">-</span>--%>
                            </div>
<%--                            <ul class="store-grid">--%>
<%--                                <li class="active">--%>
<%--                                    <button type="button" onclick="updateFilterURL()"--%>
<%--                                            style="border: none; background: transparent;">--%>
<%--                                        <i class="fa fa-money"></i>--%>
<%--                                    </button>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
                        </div>
                    </form>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Hãng</h3>
                    <form method="get" action="shop" id="brandFilterForm">

                        <div class="checkbox-filter">

                            <c:forEach var="brand" items="${brands}">
                                <div class="input-checkbox">
                                    <input type="checkbox" id="${brand.key}" name="brand"
                                           value="${brand.key}"
                                           onChange="updateFilterURL()" ${selectedBrands.contains(brand.key) ? 'checked' : ''}>
                                    <label for="${brand.key}">
                                        <span></span>
                                            ${brand.value}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>

                    </form>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Nổi Bật</h3>
                    <div class="product-widget">
                        <div class="product-img">
                            <img src="assets/img/product01.png" alt="">
                        </div>
                        <div class="product-body">
                            <p class="product-category">Category</p>
                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                            <h4 class="product-price">$980.00
                                <del class="product-old-price">$990.00</del>
                            </h4>
                        </div>
                    </div>

                    <div class="product-widget">
                        <div class="product-img">
                            <img src="assets/img/product02.png" alt="">
                        </div>
                        <div class="product-body">
                            <p class="product-category">Category</p>
                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                            <h4 class="product-price">$980.00
                                <del class="product-old-price">$990.00</del>
                            </h4>
                        </div>
                    </div>

                    <div class="product-widget">
                        <div class="product-img">
                            <img src="assets/img/product03.png" alt="">
                        </div>
                        <div class="product-body">
                            <p class="product-category">Category</p>
                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                            <h4 class="product-price">$980.00
                                <del class="product-old-price">$990.00</del>
                            </h4>
                        </div>
                    </div>
                </div>
                <!-- /aside Widget -->
            </div>
            <!-- /ASIDE -->

            <!-- STORE -->
            <div id="store" class="col-md-9">
                <!-- store top filter -->
                <div class="store-filter clearfix">
                    <div class="store-sort">
                        <label>
                            Sort By:
                            <select class="input-select" name="sortBy" onchange="updateFilterURL()">
                                <option value="">Default</option>
                                <option value="newest" ${selectedSort == 'newest' ? 'selected' : ''}>Newest</option>
                                <option value="oldest" ${selectedSort == 'oldest' ? 'selected' : ''}>Oldest</option>
                                <option value="price_asc" ${selectedSort == 'price_asc' ? 'selected' : ''}>Price: Low to
                                    High
                                </option>
                                <option value="price_desc" ${selectedSort == 'price_desc' ? 'selected' : ''}>Price: High
                                    to Low
                                </option>
                            </select>
                        </label>

                        <label>
                            Show:
                            <select class="input-select" name="size" onchange="updateFilterURL()">

                                <option value="9" ${pageSize == 9 ? 'selected' : ''}>9</option>
                                <option value="18" ${pageSize == 18 ? 'selected' : ''}>18</option>
                                <option value="27" ${pageSize == 27 ? 'selected' : ''}>27</option>
                            </select>
                        </label>
                    </div>
                    <ul class="store-grid">
                        <li class="active"><i class="fa fa-th"></i></li>
                        <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                    </ul>
                </div>
                <!-- /store top filter -->

                <!-- store products -->
                <div class="row">
                    <c:forEach var="item" items="${products}">
                        <div class="col-md-4 col-xs-6">
                            <c:set var="product" value="${item}" scope="request"/>
                            <jsp:include page="../commons/product-card.jsp"/>
                        </div>
                    </c:forEach>
                    <c:remove var="product" scope="request"/>

                    <c:if test="${empty products}">
                        <div class="col-md-12">
                            <p>Chua co san pham de hien thi.</p>
                        </div>
                    </c:if>
                </div>
                <!-- /store products -->

                <!-- store bottom filter -->
                <div class="store-filter clearfix">
                    <span class="store-qty">Showing ${totalProducts} products</span>

                    <ul class="store-pagination">

                        <!-- PREV -->
                        <c:if test="${currentPage > 1}">
                            <c:url var="prevUrl" value="/shop">
                                <c:param name="page" value="${currentPage - 1}"/>
                                <%@ include file="../commons/pagination-params-tag.jsp" %>
                            </c:url>

                            <li>
                                <a href="${prevUrl}">
                                    <i class="fa fa-angle-left"></i>
                                </a>
                            </li>
                        </c:if>

                        <!-- PAGE NUMBER -->
                        <c:if test="${totalPages <= 5}">
                            <c:forEach begin="1" end="${totalPages}" var="pageNum">
                                <c:url var="pageUrl" value="/shop">
                                    <c:param name="page" value="${pageNum}"/>
                                    <%@ include file="../commons/pagination-params-tag.jsp" %>
                                </c:url>

                                <li class="${pageNum == currentPage ? 'active' : ''}">
                                    <a href="${pageUrl}">${pageNum}</a>
                                </li>
                            </c:forEach>
                        </c:if>

                        <c:if test="${totalPages > 5}">
                            <c:set var="startPage" value="${currentPage - 2}"/>
                            <c:set var="endPage" value="${currentPage + 2}"/>

                            <c:if test="${startPage < 1}">
                                <c:set var="endPage" value="${endPage + (1 - startPage)}"/>
                                <c:set var="startPage" value="1"/>
                            </c:if>

                            <c:if test="${endPage > totalPages}">
                                <c:set var="startPage" value="${startPage - (endPage - totalPages)}"/>
                                <c:set var="endPage" value="${totalPages}"/>
                            </c:if>

                            <!-- Trang đầu -->
                            <c:if test="${startPage > 1}">
                                <c:url var="firstPageUrl" value="/shop">
                                    <c:param name="page" value="1"/>
                                    <%@ include file="../commons/pagination-params-tag.jsp" %>
                                </c:url>
                                <li><a href="${firstPageUrl}">1</a></li>
                                <li class="disabled"><span>...</span></li>
                            </c:if>

                            <!-- Loop các trang -->
                            <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
                                <c:url var="pageUrl" value="/shop">
                                    <c:param name="page" value="${pageNum}"/>
                                    <%@ include file="../commons/pagination-params-tag.jsp" %>
                                </c:url>

                                <li class="${pageNum == currentPage ? 'active' : ''}">
                                    <a href="${pageUrl}">${pageNum}</a>
                                </li>
                            </c:forEach>

                            <!-- Trang cuối -->
                            <c:if test="${endPage < totalPages}">
                                <li class="disabled"><span>...</span></li>
                                <c:url var="lastPageUrl" value="/shop">
                                    <c:param name="page" value="${totalPages}"/>
                                    <%@ include file="../commons/pagination-params-tag.jsp" %>
                                </c:url>
                                <li><a href="${lastPageUrl}">${totalPages}</a></li>
                            </c:if>
                        </c:if>

                        <!-- NEXT -->
                        <c:if test="${currentPage < totalPages}">
                            <c:url var="nextUrl" value="/shop">
                                <c:param name="page" value="${currentPage + 1}"/>
                                <%@ include file="../commons/pagination-params-tag.jsp" %>
                            </c:url>

                            <li>
                                <a href="${nextUrl}">
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </c:if>

                    </ul>
                </div>
                <!-- /store bottom filter -->
            </div>
            <!-- /STORE -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- NEWSLETTER -->
<div id="newsletter" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="newsletter">
                    <p>Đăng ký nhận <strong>BẢN TIN KHUYẾN MÃI</strong></p>
                    <form>
                        <input class="input" type="email" placeholder="Nhập Email của bạn">
                        <button class="newsletter-btn"><i class="fa fa-envelope"></i> Đăng ký</button>
                    </form>
                    <ul class="newsletter-follow">
                        <li>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /NEWSLETTER -->

<%@ include file="../commons/footer.jsp" %>


<!-- jQuery Plugins -->
<%@ include file="../commons/script.jsp" %>

<script>
    function extractDigitsSafe(value) {
        return String(value == null ? '' : value).replace(/\D/g, '');
    }

    function updateFilterURL() {
        const categories = $('input[name="category"]:checked')
            .map(function () {
                return $(this).val();
            })
            .get();

        const brands = $('input[name="brand"]:checked')
            .map(function () {
                return $(this).val();
            })
            .get();

        const minPrice = $('#price-min').length
            ? extractDigitsSafe($('#price-min').val())
            : '';

        const maxPrice = $('#price-max').length
            ? extractDigitsSafe($('#price-max').val())
            : '';

        const sortBy = $('select[name="sortBy"]').val() || '';
        const pageSize = $('select[name="size"]').val() || '9';
        const name = $('.header-search input[name="name"]').val() || '';

        const params = new URLSearchParams();

        params.set('page', '1');
        params.set('size', pageSize);

        categories.forEach(cat => {
            params.append('category', cat);
        });

        brands.forEach(brand => {
            params.append('brand', brand);
        });

        if (minPrice) {
            params.set('minPrice', minPrice);
        }

        if (maxPrice) {
            params.set('maxPrice', maxPrice);
        }

        if (sortBy) {
            params.set('sortBy', sortBy);
        }

        if (name) {
            params.set('name', name);
        }

        window.location.href =
            '${pageContext.request.contextPath}/shop?' + params.toString();
    }

    function restoreFilterUIFromURL() {
        const query = new URLSearchParams(window.location.search);
        const priceMinInput = document.getElementById('price-min');
        const priceMaxInput = document.getElementById('price-max');
        const priceSlider = document.getElementById('price-slider');

        const min = extractDigitsSafe(query.get('minPrice'));
        const max = extractDigitsSafe(query.get('maxPrice'));

        if (priceMinInput && min) {
            priceMinInput.value = min;
            priceMinInput.placeholder = min;
        }

        if (priceMaxInput && max) {
            priceMaxInput.value = max;
            priceMaxInput.placeholder = max;
        }

        let retries = 20;
        const applySliderValue = function () {
            if (!priceSlider || !priceSlider.noUiSlider) {
                if (retries-- > 0) {
                    window.setTimeout(applySliderValue, 50);
                }
                return;
            }

            priceSlider.noUiSlider.set([
                min || null,
                max || null
            ]);
        };

        applySliderValue();
    }

    document.addEventListener('DOMContentLoaded', function () {
        restoreFilterUIFromURL();
    });
</script>

</body>
</html>
