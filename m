Return-Path: <linux-usb+bounces-37502-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPl1BzIBB2rSqgIAu9opvQ
	(envelope-from <linux-usb+bounces-37502-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 13:19:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEE254E479
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 13:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6095130E185A
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 10:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23FC47B401;
	Fri, 15 May 2026 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h30i5fyL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8one9Yf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92EB47A0AE
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842096; cv=none; b=K9UclQ8J+SqlIt9Akh5DDxT9MNZmdXP6Yk8WXsmeNo80KTSX6J+0sfaFoHyOPoXXKqZ4dxmVPx4O3joH7+eZxHw+j3DQ9JLQFswqGbcYwkUUXvscGZB045U1UP90VpF3o0BSMxhWP+Gdw3kMgR5ASKb4n79AJcexz+QSzekPWdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842096; c=relaxed/simple;
	bh=79rZTqEAggicoiBdRqg4u5kofmpZCLqTyvAK6+GYcms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGDGp/8NGjZ6jw1LTZ5E/LkLQG1LCrv9+fuq6lKmRHBNyP2uPEUIWW9Sp2NFCcrChTUpc3YBMCUHA2WRWn54ASKwrI7EpPFmuMRm9anIiqPTkqFn+lPjJ8pudop9cx8gfIPqCUOcvEDtaR1daG7h+WoXZ1brLJtPwXm9+URcNS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h30i5fyL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8one9Yf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5TChw3220018
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXSl9xWJgGrKtTUXE9lPJPSwwg5bTC1u2A0FFxmrhlA=; b=h30i5fyL9qxNDuoQ
	Yu9oH+wBgaK5cOsI3Nu+6bVQjvrOUabnhDyUWmok1sofyPKAjozZ/Pg6wkqwwgzy
	RwZlFy+K2I3IpbnpRv5bj2yhFwwHfkcKkHXr9kuYvgIZvp8Vgk+AVMlfVdCWoRKb
	ATWQzCJUiVLSUU8uLCxhJ9yFELBQT6LIVhJiC8D3/8vUGME54GIpf7yDChdSMCoM
	yCzqM3qmiDzPlHUK/pETPxTw48zuZxogQ8jQisVRBmAmCXuHPBURsIZRDnXdFxWR
	26mzLvJlNBIwPXGFZOwHLojPckbdVzu5UdJ42b626+asZOC1aAqrms6iBJ8Srzj5
	SBdCLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2vrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:48:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9b8137828so97152025ad.0
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842093; x=1779446893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXSl9xWJgGrKtTUXE9lPJPSwwg5bTC1u2A0FFxmrhlA=;
        b=F8one9Yf6QehYOZgoYRWD0GOgBcM9Nt0H8wmFZzzKRZvU0WV2HSrsJsbRVM+tP1jTK
         QvKoBLUG+h3+9wlrJ7aIFosCijOdDu94avPMEErQVV0edTVi3vRjRrojiPl1yXI2hjiC
         N2EWYfmhIGrk/X4KneCJvNadaqT+24lwZTXcQX/SNx/rymLpFil+FBOvZbFZC7SdWmJZ
         3GvoAbqZfbQ2RzQeQYIgJrmMrBl6dl9EBY5S6NZkmr/U88OFV/FYiPRbIKGqU+rgT/kx
         ngBE1nJwyMX+PUolwa3/80JJHQGa8gev3OQ478v74b1E1svUgBtQZhDb3mI5tv9DqHXw
         Be7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842093; x=1779446893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXSl9xWJgGrKtTUXE9lPJPSwwg5bTC1u2A0FFxmrhlA=;
        b=Ufv1TKTgKYlGwNAQ1+x3BRAlm00mmW12UZSvW97srDknYZUyOkzMQ5MZwEhIxRi/TG
         sRZG0RoZQcfhswwDpzzllX/TI94wUMZ2TGMf1pRKReffb3UAZXRHzRo/P7RTbIXn1VKG
         dCuJScDqAbMr3XaFWAQ8T5tB0W3UXQ0PJRq+AcqkodLVFV+JrKs0Fuo5XJKRj4W/qicd
         gG9Tq+PY50EOUG7Y8ZkdOdkJLu5oAzqAI5pnsPsNNQtkLCkzucSgXotpmMPEjUcZLWU/
         tczz/+UOt9K6hPL4i+ljwbk4C0in2ovgf303TCi74ziGAzoc5XZhbqp6cyXEVHBoX1w/
         cCmw==
X-Forwarded-Encrypted: i=1; AFNElJ9YXWIReXadlE4QLqNJd5fjc50ziNj2J8RU/zpSKqOrGfwonRAB6eLmnXJ5yMTpVYw+eiOcw0jZXdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwB6EGUTP6Kttef16NKLtDuL91cTxLnItgxjT0JWaYFSG9adH6
	i/7b1oVLwCH1LW+kSQ+Yr9Yr3VycEzgpBJp8cm6NzigXLpwWEwaAJGn28KV4cN7F9ww7ljnd40Q
	B5TAkk3Tg7R40yCreWv3o5o9/0YeCQ+2lOyFG0CQQZoOkTYEp9H2MB+eyM9uP7jY=
X-Gm-Gg: Acq92OEBSiglesDSqdZlSvql5o3V6TamJo/hGdmP5bz+FnTCFhn7jDhbsN6m/fTSwMH
	u/G90YoNxdMMez/MY7H+likcHaQN6Rg2+Tb6VFhzR+2mWH+JR7V5LBoI//jfpZRgg64UTA5bj1H
	63be45GEVZjNuv9jx6mNV9UeLGH9Wa1f39oAl40ezBLLC8pa/RbuYKS3OXhjuILZxm6GL08CmVQ
	XgaV/ib1lp4bXh1rWTyGjR2xKPSmzHFKa3xO0ZLNp15jTDYFm/q8gLKo3TLIfyTiQnAScXUGxgN
	dP40uq9PmzyZEx8S0+yrfxTYHfm/jWr6F9zEBVkHTRtCZDQtaHnFoj2BHt+HF8WaOcgYRDJZjpZ
	yIAXOJYxe2im76l3hYbGWQjkq7cxvcG3/86QkX/H0/XXoEGkiDhNDjvLkW7UsZZPZUp4iMB1bd/
	EJWdD95FJFOs6my8pmp5PHHbnl26oqXqnDZ8yaGQuznDemexqxyKg=
X-Received: by 2002:a05:6a20:6a24:b0:39c:241:65a3 with SMTP id adf61e73a8af0-3b22e6668b2mr4159411637.1.1778842092760;
        Fri, 15 May 2026 03:48:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a24:b0:39c:241:65a3 with SMTP id adf61e73a8af0-3b22e6668b2mr4159374637.1.1778842092295;
        Fri, 15 May 2026 03:48:12 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:48:11 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:17:46 +0530
Subject: [PATCH 5/5] phy: qcom-qusb2: add QUSB2 support for ipq5210
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-usb2phy-v1-5-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX4Ju2b6045Wqq
 GnF1ERXwa6Sdu5xW9XDjf0KmvA68nVp2x/aOvXsAlARQu826UuXX5qqjO+tSB4yESemHLEc62U2
 wMT5awJWl+FhUNgOrUEAmOpYq2Q7nnDld7mI8yHZV2hN6zwWdske/Uqmqg7xtIbFZzZMZ5gDEgc
 z61qNaTMec681pZwXn1G64jWiHNNE7tiO/0JJXQAP3dh7XQs9JHhreADNyzHjY3SkteML2xdwLV
 9YounBrfd78eus0lLfPMMi+/f8/CQXNVc/TwnAWLZY7fs1VRGiBEdw1G7W3z0AkrhuVS+qSn6jv
 KK0FRQFbfxVHjUHg145tpXrUgyc9kKbL5W6eLMkNU24RZ4q14/J3lu9W7dbdt/fZ7b8Axc+lAkT
 UTci9kpWKVKey7G+tifrWVVCKrxlcWVBb6n2aPdQVzmPh4yDQpivzkXdzg+XWXWAl8sI8rM9tIk
 +JFU6oQnIR2IdRqtgbQ==
X-Proofpoint-GUID: cQHJkESHnu_sCW42jTO8X8Q3D5Lqz8lU
X-Proofpoint-ORIG-GUID: cQHJkESHnu_sCW42jTO8X8Q3D5Lqz8lU
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a06f9ed cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YjFiIu3VuMthEzLBwjoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: 2FEE254E479
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37502-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the phy init sequence for the Super Speed ports found
on ipq5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..749106175742 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -929,6 +929,9 @@ static const struct phy_ops qusb2_phy_gen_ops = {
 
 static const struct of_device_id qusb2_phy_of_match_table[] = {
 	{
+		.compatible	= "qcom,ipq5210-qusb2-phy",
+		.data		= &ipq6018_phy_cfg,
+	}, {
 		.compatible	= "qcom,ipq5424-qusb2-phy",
 		.data		= &ipq6018_phy_cfg,
 	}, {

-- 
2.34.1


