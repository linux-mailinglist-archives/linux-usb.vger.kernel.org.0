Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6AF27279A9
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 10:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234712AbjFHILT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 04:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234595AbjFHILQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 04:11:16 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E062685;
        Thu,  8 Jun 2023 01:11:14 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3587DKsp014183;
        Thu, 8 Jun 2023 08:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=EvVCq+fSL3hZund+bI6Av8FrnqRN9Kpvc7+n0PKiSP8=;
 b=PSt4baUZIDXZJB1mQHy7dNq2IhWM91uRRMM6EyhG1zLoZ1R8PLDla8krls+P78KvfGVG
 zpt/comuSE7J+7wuGgb2XyrBjNMDq3q4c2y2BvUpEA/kEEBycNkWJEZ+3MBPmTQLAKu9
 tvLa2q4zkw8naLZLeCqwldvAmgM7RFx02gnjuEn4XKkS97j50kfS3JgYhQiC4B7S1rxS
 JR0pcvGMxRj1fqxOeJzXb/S0z/nEZwMwkXMYKQm7xsePiwURQx9Ly4L0zn3W7T5xhJuJ
 rm9x9M8AcmfUQLpvDOlH5Jks34Iu0RgFgztGvOITTeGYs4jq+tNA1Lo3Y1vB59NZJrir hg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r33uygqbt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jun 2023 08:11:03 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3588B3I8032505
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 8 Jun 2023 08:11:03 GMT
Received: from varda-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 8 Jun 2023 01:10:58 -0700
Date:   Thu, 8 Jun 2023 13:40:54 +0530
From:   Varadarajan Narayanan <quic_varada@quicinc.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <quic_wcheng@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v12 3/5] arm64: dts: qcom: ipq9574: Add USB related nodes
Message-ID: <20230608081053.GB16505@varda-linux.qualcomm.com>
References: <cover.1686045347.git.quic_varada@quicinc.com>
 <5a14d113e90c85777d1c01af38a85f40d35519e0.1686045347.git.quic_varada@quicinc.com>
 <307409f2-a516-4aea-45bb-137ffc2bc725@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <307409f2-a516-4aea-45bb-137ffc2bc725@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _LnJt_vxgUAwEwTT-zPMGNq0bYGUolGG
X-Proofpoint-ORIG-GUID: _LnJt_vxgUAwEwTT-zPMGNq0bYGUolGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_04,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306080069
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 07, 2023 at 08:50:41PM +0200, Krzysztof Kozlowski wrote:
> On 07/06/2023 12:48, Varadarajan Narayanan wrote:
> > Add USB phy and controller related nodes
> >
> > SS PHY need two supplies and HS PHY needs three supplies. 0.925V
> > and 3.3V are from fixed regulators and 1.8V is generated from
> > PMIC's LDO
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> >  Changes in v12:
> > 	- Rebase
> >  Changes in v11:
> > 	- Rename dwc_0 -> usb_0_dwc3
> >  Changes in v10:
> > 	- Fix regulator definitions
> >  Changes in v8:
> > 	- Change clocks order to match the bindings
> >  Changes in v7:
> > 	- Change com_aux -> cfg_ahb
> >  Changes in v6:
> > 	- Introduce fixed regulators for the phy
> > 	- Resolved all 'make dtbs_check' messages
> >
> >  Changes in v5:
> > 	- Fix additional comments
> > 	- Edit nodes to match with qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> > 	- 'make dtbs_check' giving the following messages since
> > 	  ipq9574 doesn't have power domains. Hope this is ok
> >
> > 		/local/mnt/workspace/varada/varda-linux/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dtb: phy@7d000: 'power-domains' is a required property
> >         	From schema: /local/mnt/workspace/varada/varda-linux/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> > 		/local/mnt/workspace/varada/varda-linux/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dtb: usb@8a00000: 'power-domains' is a required property
> >         	From schema: /local/mnt/workspace/varada/varda-linux/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> >
> >  Changes in v4:
> > 	- Use newer bindings without subnodes
> > 	- Fix coding style issues
> >
> >  Changes in v3:
> > 	- Insert the nodes at proper location
> >
> >  Changes in v2:
> > 	- Fixed issues flagged by Krzysztof
> > 	- Fix issues reported by make dtbs_check
> > 	- Remove NOC related clocks (to be added with proper
> > 	  interconnect support)
> > ---
> >  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 104 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > index 0baeb10..8f7c59e 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > @@ -94,6 +94,24 @@
> >  		};
> >  	};
> >
> > +	fixed_3p3: s3300 {
>
> Use regulator- prefix for node name.

ok

> > +		compatible = "regulator-fixed";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +		regulator-name = "fixed_3p3";
> > +	};
> > +
> > +	fixed_0p925: s0925 {
> > +		compatible = "regulator-fixed";
> > +		regulator-min-microvolt = <925000>;
> > +		regulator-max-microvolt = <925000>;
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +		regulator-name = "fixed_0p925";
> > +	};
> > +
> >  	memory@40000000 {
> >  		device_type = "memory";
> >  		/* We expect the bootloader to fill in the size */
> > @@ -465,6 +483,92 @@
> >  			status = "disabled";
> >  		};
> >
> > +		usb_0_qusbphy: phy@7b000 {
> > +			compatible = "qcom,ipq9574-qusb2-phy";
> > +			reg = <0x0007b000 0x180>;
> > +			#phy-cells = <0>;
> > +
> > +			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> > +				 <&xo_board_clk>;
> > +			clock-names = "cfg_ahb",
> > +				      "ref";
> > +
> > +			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
> > +			status = "disabled";
> > +		};
> > +
> > +		usb_0_qmpphy: phy@7d000 {
> > +			compatible = "qcom,ipq9574-qmp-usb3-phy";
> > +			reg = <0x0007d000 0xa00>;
> > +			#phy-cells = <0>;
> > +
> > +			clocks = <&gcc GCC_USB0_AUX_CLK>,
> > +				 <&xo_board_clk>,
> > +				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> > +				 <&gcc GCC_USB0_PIPE_CLK>;
> > +			clock-names = "aux",
> > +				      "ref",
> > +				      "cfg_ahb",
> > +				      "pipe";
> > +
> > +			resets = <&gcc GCC_USB0_PHY_BCR>,
> > +				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
> > +			reset-names = "phy",
> > +				      "phy_phy";
> > +
> > +			status = "disabled";
>
> status is always the last property.

ok

> > +
> > +			#clock-cells = <0>;
> > +			clock-output-names = "usb0_pipe_clk";
> > +		};
> > +
> > +		usb3: usb@8af8800 {
> > +			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
> > +			reg = <0x08af8800 0x400>;
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges;
> > +
> > +			clocks = <&gcc GCC_SNOC_USB_CLK>,
> > +				 <&gcc GCC_USB0_MASTER_CLK>,
> > +				 <&gcc GCC_ANOC_USB_AXI_CLK>,
> > +				 <&gcc GCC_USB0_SLEEP_CLK>,
> > +				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> > +
> > +			clock-names = "cfg_noc",
> > +				      "core",
> > +				      "iface",
> > +				      "sleep",
> > +				      "mock_utmi";
> > +
> > +			assigned-clocks = <&gcc GCC_USB0_MASTER_CLK>,
> > +					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> > +			assigned-clock-rates = <200000000>,
> > +					       <24000000>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "pwr_event";
> > +
> > +			resets = <&gcc GCC_USB_BCR>;
> > +			status = "disabled";
> > +
> > +			usb_0_dwc3: usb@8a00000 {
> > +				compatible = "snps,dwc3";
> > +				reg = <0x8a00000 0xcd00>;
> > +				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> > +				clock-names = "ref";
> > +				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> > +				phys = <&usb_0_qusbphy>, <&usb_0_qmpphy>;
> > +				phy-names = "usb2-phy", "usb3-phy";
> > +				tx-fifo-resize;
> > +				snps,is-utmi-l1-suspend;
> > +				snps,hird-threshold = /bits/ 8 <0x0>;
> > +				snps,dis_u2_susphy_quirk;
> > +				snps,dis_u3_susphy_quirk;
> > +				dr_mode = "host";
>
> Why is this property of the SoC?

Will remove it from here. It is present in ipq9574-rdp433.dts

Thanks
Varada
