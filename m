Return-Path: <linux-usb+bounces-1812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB6F7CCED8
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 23:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DF49281B57
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 21:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA0B2E41E;
	Tue, 17 Oct 2023 21:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QaXsDMEF"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B675B2E40C;
	Tue, 17 Oct 2023 21:02:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B88A93;
	Tue, 17 Oct 2023 14:02:24 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39HJkhiW004984;
	Tue, 17 Oct 2023 21:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=yJyE0osReE6bCCORSSyCgWhEu5H9mHN29yMoEw38mcs=;
 b=QaXsDMEFSLJ3pWjNsCH2VNZSkV5JdNVa5dDtmvzFT2Y7hzg7ZS7P6FlmDQu69kaPtuMi
 QhrczF7rGcIgjLWowyqo0Beq20/h+DLxxrwDXfsWOLrAdRwcnIkOmLnPGOeB4WlP+cLc
 t5uMwgoz5C4Vj016bG4uL+2uwiYnRiE8Te6B+XCA+TDZGvAawwXPucXg0/0jwC/F+PWc
 4J4AsnW8IBn4QQ1d7Y22TaNHnlpRdB3ihuJAeLaGwI0PrIGhrJFX8wksCxI5ucvfKDTS
 Wr9m7sBfWBn6qpRz9HW7PfCNrvqYmvn6cSErOapYH8fowO6nVF5of5rMSOp2txBSC2JZ Lg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tsb3xu3qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 21:02:11 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39HL2Bng013796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 21:02:11 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 17 Oct 2023 14:02:10 -0700
Date: Tue, 17 Oct 2023 14:02:09 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Herring <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>,
        "Krishna
 Kurapati PSSNV" <quic_kriskura@quicinc.com>
Subject: Re: [PATCH 10/12] dt-bindings: usb: qcom,dwc3: Introduce flattened
 qcom,dwc3 binding
Message-ID: <20231017210209.GU3553829@hu-bjorande-lv.qualcomm.com>
References: <20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com>
 <20231016-dwc3-refactor-v1-10-ab4a84165470@quicinc.com>
 <20231017183136.GA2438579-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231017183136.GA2438579-robh@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T3MFkpIuQZx7FAsFwol4n_WQd8xpNvQt
X-Proofpoint-ORIG-GUID: T3MFkpIuQZx7FAsFwol4n_WQd8xpNvQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-17_04,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 mlxlogscore=769 malwarescore=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310170178
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17, 2023 at 01:31:36PM -0500, Rob Herring wrote:
> On Mon, Oct 16, 2023 at 08:11:18PM -0700, Bjorn Andersson wrote:
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
[..]
> > +  reg:
> > +    description: Offset and length of register set for QSCRATCH wrapper
> > +    maxItems: 1
> 
> Isn't this more things now? Or the description is wrong.
> 

The description is wrong, the single cell is now intended to cover the
whole USB block, which spans XHCI, DWC3 and Qualcomm glue parts.

Regards,
Bjorn

