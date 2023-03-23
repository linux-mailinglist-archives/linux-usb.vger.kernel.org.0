Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5CEA6C5FD3
	for <lists+linux-usb@lfdr.de>; Thu, 23 Mar 2023 07:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjCWGha (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Mar 2023 02:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbjCWGh3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Mar 2023 02:37:29 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493B31E2B3;
        Wed, 22 Mar 2023 23:37:28 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N49WI8004664;
        Thu, 23 Mar 2023 06:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=FNg5Oh6Q1umWQmzGDXWoO0b7gZutocILacI50suqzjk=;
 b=TsTYowU8jt+RN0zklRIMgSc4Qbumb1I7UM07ZvYBfLMDK06gcydR+7IdZIxLBaKJMCmw
 IV/jVJCcXx1p46rhWr75gC1BUZtyUbQxTAe2rLS1B5QCYO75vS1kPtkWcbKYJuBJO0PR
 fqtzOcr5IcN5fvnLgLeGIHcXYh5d57VbM1UpLsB88TV++uK6vFWwG36UJoC/JZ6w/HUb
 69vHL96i/WTub+lU0sywItUf4wu0GkjtlJjPx2R1bzhZx+ogysTpOf6o4Q4fbQNzAHvQ
 EmkYZU34HaQKKE4s8YIAVrQ1zBGc3iTEZtFLLv/MI1cSOf1CA3OknxHKXgJKetLCIlDR vA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pgfaxg8us-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Mar 2023 06:37:19 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32N6bJoe024806
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Mar 2023 06:37:19 GMT
Received: from varda-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 22 Mar 2023 23:37:12 -0700
Date:   Thu, 23 Mar 2023 12:07:06 +0530
From:   Varadarajan Narayanan <quic_varada@quicinc.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <quic_wcheng@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 2/8] dt-bindings: phy: qcom,qmp-usb: Add IPQ9574 USB3
 PHY
Message-ID: <20230323063705.GA19800@varda-linux.qualcomm.com>
References: <cover.1679479634.git.quic_varada@quicinc.com>
 <e34d8eddc1dda8bb0ff840a7dd18ca4dd6c62d22.1679479634.git.quic_varada@quicinc.com>
 <c52a329d-8683-de82-9b55-209b99ac36c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c52a329d-8683-de82-9b55-209b99ac36c0@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jjlrriOG6OMwRrVapGnVNpVWfVfBCuS0
X-Proofpoint-ORIG-GUID: jjlrriOG6OMwRrVapGnVNpVWfVfBCuS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=934 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230050
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 22, 2023 at 10:52:44PM +0100, Krzysztof Kozlowski wrote:
> On 22/03/2023 11:44, Varadarajan Narayanan wrote:
> > Add dt-bindings for USB3 PHY found on Qualcomm IPQ9574
> >
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> >
> > ---
> >  Changes in v2:
> > 	- Updated sections missed in previous patch
> > ---
> >  .../bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml    | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> > index e81a382..beae44c 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> > @@ -21,6 +21,7 @@ properties:
> >      enum:
> >        - qcom,ipq6018-qmp-usb3-phy
> >        - qcom,ipq8074-qmp-usb3-phy
> > +      - qcom,ipq9574-qmp-usb3-phy
> >        - qcom,msm8996-qmp-usb3-phy
> >        - qcom,msm8998-qmp-usb3-phy
> >        - qcom,qcm2290-qmp-usb3-phy
> > @@ -204,6 +205,27 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > +              - qcom,ipq9574-qmp-usb3-phy
> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 2
>
> toplevel defines minItems as 3, so are you sure this works? Did you test it?

Yes, this is tested. Able to do I/O.
We only have 2 items. Is it ok change the minItems to 2?

Thanks
Varada

>
> Best regards,
> Krzysztof
>
