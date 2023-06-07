Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 791F87256E6
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 10:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239278AbjFGIFr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 04:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239189AbjFGIFY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 04:05:24 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC291994
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 01:05:16 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30aeee7c8a0so228594f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Jun 2023 01:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686125115; x=1688717115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BMgX8L8sHxYnJU0Kk9lp9fncnGldl5h6suLJvCxAuE=;
        b=hvWcKYP0Tfmaz+gqe5fwMNCuILaExhgIUOpkZYhOm07iQQW0n1kHGWXwCj3q08wH4y
         B0Bezdwt/VGNJ6nB1Wg4y7Nra/HKTSmEfLswvV0Z7KLGYkF8cpsPV5/Q72XPyGvbyX1F
         m6nrkYip7SN+EoBMeJm8sQJaN8EpqKz5sm0ZzHsFCbKc4S55rLq+W2X0zxPFHvbERSbk
         zhj+Qjtql5tKXxflV3KqtO0OgOhkS5qFiWnWYiFngJlgaa5Bah9FHHtO1s3ABX7AANN4
         Yud6yK626P+gAE5nDef63iER72IF8phHNcMG2eNUnaV8A8SjJxVhkH5VQUDRqZ5hcK7l
         gnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686125115; x=1688717115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BMgX8L8sHxYnJU0Kk9lp9fncnGldl5h6suLJvCxAuE=;
        b=HdT9QqqXBr6W2TgGASLMMy8J/63iftP4bJeRsNopS+mCZnIEU8xILLgO8eCmSqb6Fw
         B10mev+RdmpqngEBT/EyQMm5ho0E0tejtID5G9Y72jHD1Z6xViUj0Ce7A6w9czZypyXm
         Fn4hOkEuk5fNW6/4nI6i3Da8TlOEhl6TI4ort7whiQqChwwqUT83WLhMZcfnNA4rWXHe
         s2XhIkRyYuvqF5sFO0pyaaFjIeAHagQf2rPDag/jnCgYbi9JZkokhD3iOqr4O8p6CGqO
         YgqeD22mEOuE/6IANQPzn5+6M64jJMopEj2K+vRGrPQAOHGYFxA5S7c57kpdd4m2C4gs
         0zdA==
X-Gm-Message-State: AC+VfDxG2tOzS/jKv4Kpy3Y/6CNMTfuSUBszRp/0vlb25gW4uqmK2vNB
        7nu+mUP939CuwAOK+tsca1Q3Tw==
X-Google-Smtp-Source: ACHHUZ5Z7dbS575fbWq+JNUF336KCNepURQ8yRMNHB/1vctEvycNU+KsdMqSOfAgEPKsC5dChYjphw==
X-Received: by 2002:adf:eec6:0:b0:30a:f60a:dc3c with SMTP id a6-20020adfeec6000000b0030af60adc3cmr10217932wrp.24.1686125114986;
        Wed, 07 Jun 2023 01:05:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id h8-20020adfe988000000b0030ae5a0516csm14706269wrm.17.2023.06.07.01.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 01:05:14 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 07 Jun 2023 10:05:07 +0200
Subject: [PATCH v2 8/8] arm64: dts: qcom: sm8550-qrd: add pmic glink
 port/endpoints
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-type-c-v2-8-3bbdf37575c3@linaro.org>
References: <20230601-topic-sm8550-upstream-type-c-v2-0-3bbdf37575c3@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-type-c-v2-0-3bbdf37575c3@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3107;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=O6DsgJkXkMoj5YSoyFuXtSzweUO2cUZutAkIATGqmXw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgDowxwNGEFnMKaq3HdaV9vYlz1SQ6C0PZRU0+pnS
 eZE6XXWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIA6MAAKCRB33NvayMhJ0cEbD/
 9fbcB3ooYanIZTo3zkxtW/yeF4T0+Y3319LYVuSFA51PnCpzPmIR485/cWJfcjeQOUcRxtvmF6mwHo
 eRJlWY1NPl1i3HsLbG/sBlva6MVKjt28jHgj4v4zkgrh1yyrPpZ8sm1e4VXDyfKGvqMVjQJR+J1E7q
 0OQ2iWFHETHmhorDz/U61zYZpXo3YxOJq4k8KuaD01LGN1MRTPkrqqhO+6HRBKN49UOzWo/b+RTuDN
 mFWqgiUG7viqhXpyI9ZBu9N+Jl5qU4aBCRY3I0M1DLNDVs+GiQJroq7Iqb1TRDEnJOgg45gXCqVb4h
 8dfbDJ0R3XsWr00731yJsVsuYQ/HBnxAenoENK8BCBaq8YyRKoKS/LcW0D2lb+DQFC4JVRQez01c1X
 1jdzn9qEjMN2zqdmj6vwHtJPjtPAxxwnQcphkeGTmiOs19eSGN88c5J6m5h+L14qiDKgSx8Vzsspe7
 WKWQ/8oUdidDetD7D24JEcil9pDjjzqWjoizhGWprpVRD9z+SAWfYu8jUNqg3gseZpsSWFQE08e9jb
 vJGzog6AhUxFNLK8XZs1wlP5ZwJWRy16n0Y5mooYjydD6gh8YIkzlh3L+mzyL7DnEr7HIZ9JeuNJU1
 ZKdaeMDZyQRfkPQVxl5kmmoXJNpND5bkAoc4dfbJgVNEfzaWUe1KrtOV2q6Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add nodes to support Type-C USB/DP functionality.

On this platform, a Type-C redriver is added to the
SuperSpeed graph.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 99 ++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 8669d29144bb..7126c14836c9 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -64,6 +64,7 @@ connector@0 {
 			reg = <0>;
 			power-role = "dual";
 			data-role = "dual";
+			orientation-gpios = <&tlmm 11 GPIO_ACTIVE_HIGH>;
 
 			ports {
 				#address-cells = <1>;
@@ -81,7 +82,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_ss>;
+						remote-endpoint = <&redriver_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&fsa4480_sbu_mux>;
 					};
 				};
 			};
@@ -420,6 +429,69 @@ vreg_l3g_1p2: ldo3 {
 	};
 };
 
+&i2c_master_hub_0 {
+	status = "okay";
+};
+
+&i2c_hub_2 {
+	status = "okay";
+
+	typec-mux@1c {
+		compatible = "onnn,nb7vpq904m";
+		reg = <0x1c>;
+
+		vcc-supply = <&vreg_l15b_1p8>;
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				redriver_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				redriver_ss_in: endpoint {
+					data-lanes = <3 2 1 0>;
+					remote-endpoint = <&usb_dp_qmpphy_out>;
+				};
+			};
+		};
+	};
+
+	fsa4480@42 {
+		compatible = "fcs,fsa4480";
+		reg = <0x42>;
+
+		vcc-supply = <&vreg_bob1>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				fsa4480_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+		};
+	};
+};
+
 &gcc {
 	clocks = <&bi_tcxo_div2>, <&sleep_clk>,
 		 <&pcie0_phy>,
@@ -471,6 +543,15 @@ &mdss_dsi0_phy {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+};
+
 &pcie_1_phy_aux_clk {
 	status = "disabled";
 };
@@ -650,7 +731,7 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_dwc3_ss {
-	remote-endpoint = <&pmic_glink_ss_in>;
+	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 };
 
 &usb_1_hsphy {
@@ -666,9 +747,23 @@ &usb_dp_qmpphy {
 	vdda-phy-supply = <&vreg_l3e_1p2>;
 	vdda-pll-supply = <&vreg_l3f_0p88>;
 
+	orientation-switch;
+
 	status = "okay";
 };
 
+&usb_dp_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp0_out>;
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&redriver_ss_in>;
+};
+
+&usb_dp_qmpphy_usb_ss_in {
+	remote-endpoint = <&usb_1_dwc3_ss>;
+};
+
 &xo_board {
 	clock-frequency = <76800000>;
 };

-- 
2.34.1

