Return-Path: <linux-usb+bounces-36480-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDy3B81n7GkPYgAAu9opvQ
	(envelope-from <linux-usb+bounces-36480-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 09:05:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F354655DD
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 09:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91EB6305F3DC
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 07:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3C932A3EC;
	Sat, 25 Apr 2026 07:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omOVidos";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a64N2SI0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3403316199
	for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100423; cv=none; b=YLvA3xc8fvli936JpxSEhyBLfkcP6hObgaMH4IxDwNVfZ5f61P67DqkDpTYnOrN7IWRMWaQpbRqHYR+g6H8ASwrgWdWaLx1qudDRHc2j3Au8NfV0GWWKqteog1iQySZPvN1MBoo2QElNq8NPgGu9uWK9dkaWtT5tltcSAmhCaOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100423; c=relaxed/simple;
	bh=NXr+O0DCE8P7lmctaJk+badu117Po+GBS1RB9vjhu/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oq7uUmmkIsAIHXiNgHFmzkiUtyTE8VCbE5NsyvFnBDoNUZa5WSaW55ypeDm20gMvYHbCOX7pSyjI128takmofEXqv2N+3cGa5ayI5ebA/y7MDsIDS0fOLnZoIKJKv1ul09ovBH4RmB7CF1H4ejSYB46dRXTnxn0gDdcTTgp2r18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omOVidos; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a64N2SI0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3N9ML207455
	for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 07:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/Ff6lkNUcmH
	Y8eKeVweo0bOa1Idufu7/zbttF+e+/7I=; b=omOVidos9YQYr6k628pThYfsR1+
	u4r7D5VZkK6tFJMyWmYWI5HYGnRE9mduRkWL7/09C67SN+T7mx44mF9H33+kWd2j
	LgC3caKCPrP4i1WwZdbnUEPIh5KjjEsfmV1GqybHoMy3LvU+i4OOSYc/ESQIZ/Du
	kolH90zZHjPNDE9rxn4garTGRz+6pf8zyw0zd/RWIe/HPKu26jQeqDutEPQK5BAz
	39m3DxhK6gGO6lL33sHVjgJUGDxxIDd5ol7IqbfPnapkYSW0vHggqLzwX4okvzzL
	ixOOs/vzKuuxhqmSOjIhlmFeCqGjG9F+FBNGNEBixoXH6onz/8HiArqs3Fg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf0bm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 07:00:16 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c8d7d4a79so6737346c88.1
        for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 00:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777100416; x=1777705216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ff6lkNUcmHY8eKeVweo0bOa1Idufu7/zbttF+e+/7I=;
        b=a64N2SI0jCQfLcTnBu4YtnGDaJAzzZ/mqxC4mz/rXDE9GwnJM28J4oqtokWjmsJhqu
         7vAixqNofjJT2oZQjbJlhhFS393ivtC1P10i0hVadj+EeHV6MheqYwiOYB55WiTsL3Sl
         ruHUL3erVjsWTs1oA/8X/ypDr9xfG58YQ/C2Inz/MYJMgHurWKT8Sah6SBc9N2J6fs7j
         vDM/4pxnZiotaBeM022Yxs4NCgI4C6KBZZlKiSSk3oK/PZWTSBiR0bVdZB4iKLWo2T9l
         QaHT5oQnmIR6Hm3htljKbUBlFDEM9ipnncwofjbu+T6/JvYrSqPTSfuHSqIw7ngMdXUL
         dq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777100416; x=1777705216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Ff6lkNUcmHY8eKeVweo0bOa1Idufu7/zbttF+e+/7I=;
        b=cNeQZv4RHD21pPLXkSNE6khxlJFBTJ1xN9Myjatsk8+w+eVXVbpl7FubEMWbPqPKyV
         bZvurC9u+/BudpiF5LK6yDeEa4E1ZEcAD6XA0ZeZf60BjafpB36Igf9QB0ADx/Hle5sv
         k2m+oUCx1C5A5/wYeFp72tZrK73g4x4EW5GbpgrmbauYEtiN1kqtaXPK7EzyqJeP6a9I
         3tsBKqEDK+JISQyI57z/PjugDUQUJZDruomqAwyQbjXb/MDJrmowgcTKP1Wknb794b7e
         rPzOBlL3owau7F5ARqxQIMR0+rcfQJjyD1Oht/kGKHdFN2rQxGA8B2H2HF0EbFIZWK0A
         DEZg==
X-Forwarded-Encrypted: i=1; AFNElJ+R0kSbYNdNKwzPO3mutYIuWLtRzvr9KKnXehZaI7c7gGmXM1H3BT/XirbmhtTYaUn1Nl0tAGv1GWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBm8XngyMh5Sy9tnjazdZ7mUFBNX+LHf9sV7KSmH5fDHBBrOIJ
	7E1V2zzgn3ADAE2PICMSapdAPZ5T+T16dMuhiY5K8DiYUzvWzWOPvHxLsdzdne6bEK5SxezUne2
	PVZBku596HmL4MhW5Qr2JMLnFwQThCXTsxPad/i+C5FQhbXpVxIxYuEkY/q+hx00=
X-Gm-Gg: AeBDieve8xf35fF53fXdwY+7QPX7lpzD9l4E9Vqe1UgcFdJp4m3MLBnVka/onxjPpBY
	oyqwkmSu5BSfxuJLFpVmwoznLXx7yI6uNXpqC6p9aBEwuDqUkhXWRJ0E8h8GQbIR5GMQOXumVr6
	VDj3H8ZyJVCa8d/dZ3rPv1j6eLzmJDhkrUIZlLLoqu2jNaj9SLiU/nsU98QTamAKJLEHd7J8DX/
	7JP8kQNvQhbFr90JnhJtyzpPpA0Z5siT+DXD6Nkk4E7eFJS64iPgbQflUlaW63rj7CNonBBrxDg
	gpc6DEPdeE50+4QbG8VISYgzc00s9UqgbXceVbL3E+m01UjwChGfUp+37ZG1aLFnyVlgSeXdKnb
	13Cv8r4uWDyOKMTlXsA72k9gzNFSOiWamkJDCCupqkxfhdTSFpcFlGqZI/sBLfHrBGzhQLviX88
	oBfFGHW8+mAg==
X-Received: by 2002:a05:7022:90a:b0:128:d715:b717 with SMTP id a92af1059eb24-12c73f82878mr17045182c88.13.1777100414440;
        Sat, 25 Apr 2026 00:00:14 -0700 (PDT)
X-Received: by 2002:a05:7022:90a:b0:128:d715:b717 with SMTP id a92af1059eb24-12c73f82878mr17045173c88.13.1777100413911;
        Sat, 25 Apr 2026 00:00:13 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc2dfad8csm9430630c88.3.2026.04.25.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 00:00:13 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
Date: Sat, 25 Apr 2026 00:00:00 -0700
Message-Id: <20260425070002.348733-3-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
References: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _ZMIhVBmi37wAgAs-Egffd3wnPR6czrM
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69ec6680 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mzSaEd5VEpIjRnDHYqYA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: _ZMIhVBmi37wAgAs-Egffd3wnPR6czrM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA2NSBTYWx0ZWRfX9F4pYIsE+mL2
 g2WtN8zfq4FNiUOv7jei/1ysVIHI0nGnloTXmrW8Qu5rwg0TAfpkpiiZJow/CmTgp99xdglZVbB
 9PevoGlDX7S+Ku5XiNbdFgWMKTAT/0sCr6M7qWX95uxGBwF4Czrr2AQ9b1kgQg4DdNocfCNChlt
 bhOF46OFpXwwUc8apXOqky2hyRkKlf8aLvs5HDW6ACtKJu6aruYEQl1ACLRg1GRjbCMepwnN1a/
 VCPqnZ7S6RMuHsecedHbU7CPiIZFxWqM1/wYj27+35sXGug7JbKzSOA5AyHQXl2I9we2eo2XIEr
 4LWAfrwCQesRMP9LleVd2ij2d3+x0Py822zWW/SRxC6WxYB0ZXZg3Q1lOYb/1IFcou5NjENzWkf
 AvRliPeyL/j5hshxtNkj4KXXhxaJO+1y/Znv4K1fEVQfqfL1fCi8oeyGhIbBocI9whlqge8WsfL
 EoKPgtCYHxDs1I6rocQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250065
X-Rspamd-Queue-Id: 74F354655DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36480-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the M31 eUSB2 PHY for Hawi which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on the Hawi
with that on the SM8750.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index cd6b84213a7c..c0e7e2963ce6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-m31-eusb2-phy
+              - qcom,hawi-m31-eusb2-phy
               - qcom,kaanapali-m31-eusb2-phy
           - const: qcom,sm8750-m31-eusb2-phy
       - const: qcom,sm8750-m31-eusb2-phy
-- 
2.34.1


