Return-Path: <linux-usb+bounces-37499-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK3/Nzb7Bmp6qQIAu9opvQ
	(envelope-from <linux-usb+bounces-37499-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 12:53:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8356554DCE2
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 12:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32BAA3027F7E
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 10:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A441477993;
	Fri, 15 May 2026 10:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbAC2wjM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhzjRGvR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AF7477994
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842081; cv=none; b=HiIEjueQxz2ppiRC37978j1WmqO7C9+HHxYkJ/P3kH0rbj6j7PzeqSO+caRH9wjjV84cDtzJ1lnbiRY1m2eNtQqzszTYgV7aLeAk6gMtvMBaquGOZadNho0JfUJwzI2IDWUW/waLGXk51aoRAnfn+lVECOqnG06rTuRmQlPov00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842081; c=relaxed/simple;
	bh=R6+dVh2XqI14cCIE4/7mO2Ktctr5Aljw6gefqysMyrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8hF4+LssxrbV+weSBYH5xIG661BpFhYsl9bYbpJUK349og5CC+0QvvgixH/slngLnQVN+JPpvoZSQ8yWCKguNoNJZqis58Q50dNEtqg1CI7sruMZdjlcu0g4RQw6tQRQAiJKOAVbxP/Emfj2MoTtr54KVVQKPQ2HBC5S7YrLLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbAC2wjM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhzjRGvR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5931k4020762
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sn8q1HdVYoRm1djZaFGYIIMjhSJus/GnfDru0Q1XOxE=; b=WbAC2wjMPFRP8mMa
	YEqF6A6q8KiAiX9qu9+x7bPT42+TdbHQGlh/ZIboZ/wyQ8eUqO6Jd8PI33NON3Bc
	Yd3n6hDEdQwsh34D+XRUTH9yJrNCqxRYG1rGsWkCDRdigjWw/oq+lblEbwe+nSDJ
	OT4UNNf9UsqJ6rQ9DfBs9kCiPJ7WSswgEoFZKZ6osV74OJQMVSoF7BMQ489CzgvQ
	dj0Wgpx/24X/dWDKDPa529/Vg8Ib8Swv0mwck3LJLjFN13HHhKGL9N11iAkWCzNg
	HowLgCC1LnbWztEMRQpTxLf3PRtoIAfvOpBGlJM8MQ6kYUCiPEpeCiTRFnpJXCZD
	51G0Ag==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1rtwsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:47:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8276c91addso3902917a12.2
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 03:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842079; x=1779446879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sn8q1HdVYoRm1djZaFGYIIMjhSJus/GnfDru0Q1XOxE=;
        b=QhzjRGvRpA78hi1mrDNWGxJlpBoUkTcHV6Dg5/CTiAowFjUIyb4ipdcuGSu0+zS/uj
         wIo4IPuKmQf9WBHyGhVXGIp6oJpRLu7XXWPS2/nJmGMFUGRy1KDDGde6HCig7dgO7bEc
         XcfEJsLEbYgnmXylfta5e+UCpsCQ0OVRlHhG37+5gL1Xj2yveIQmg1RCRxGkJaZ/WaX9
         GWw5N5JJq/0V1GQbccAW8tKtG12/AHakLwTTjc90u8AUST+8EVXwe9qcjq8CxS3480wk
         9qvTWmppLGmSK1q22tbAeRmVaiIGQZ0h5uOxkqd0e4TQf0g5o3J8D/oGCpmbo5bXFogp
         visQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842079; x=1779446879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sn8q1HdVYoRm1djZaFGYIIMjhSJus/GnfDru0Q1XOxE=;
        b=VFGDPMeNPoh9nPd66RV5iPQxEV/6NUnu6X9KD5E8yfRHL2k+jl3L1gOFwIfQDDtjeb
         DZzMekFTt15TBs7vmgoNvKxdLgBJrcm4UIH/UBeh6ZhSZKkQskvLNE+fqXgWxzJ4N1Rc
         xBel0unKclRBWc02B9gLhD5w7iTktxSWQiWO0U2hMw9vHSxCTE/rJ+9Rlx1yvI2S2aBI
         Xh9DgATyxBBBQNnx5ztiKoZjeE3JH+aALOv2wpmGMrWJGnlkGv+Y7mJuttJCjm6tnZ1j
         POlmtXfEC7BwjVVWwJ69LIVXyda+BTnZb7wh24CXtC35FNW++ARlunR1GyGbXjmLHkDR
         ZqPg==
X-Forwarded-Encrypted: i=1; AFNElJ/qX/cU4u1ZE+6W5fGA9EKi3+rHxX9VdBzUP30pDlgiw5P090odR50deAGnfOQqWG01fHoC4uWN6y8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAH6bsbuWmIF7vV7WRpdas37LdiF3k9a1D3gUF74+tw6DHtQny
	gIdyuEoreA9fhdP0Gk/rAQvNggCblJzf1kfg0ZALacVMBxTTAUhiSYea7ddR4A1vebqwGHY4pwI
	Zyzejbd+J8I2ii2ZQq0Dw03Rx6rJXHw4e5CEBRxXz9DCTObkqSUJRFOrmipWQ7sw=
X-Gm-Gg: Acq92OFHq+nEfITsghZs9mfCjIq8tRl0tTsreKUHYSz2DngkSml1GMjCEm/W8YJvtsE
	DVyaD+xe1iyECsUEdj/ie6HKG6eY7KpaRBPhokNRjoUfb7E+tVdCQBxDwSXnptO49iKl1d2K/I0
	1VXHmnmZOt7WlvvHjyH1PVJblkvojVoViqxPwHoj4eUMXQOo3vMTUlOaCZ+29PMLbmsheYOYdrx
	bnrvCxmvvB+VlvNGLFUC8OKB6u/izSG/M8qjyyrVKeSbuMARi3DMICm4DZjxAd0jVzh9iDbvNt9
	yGG2ADvZQmFyxUDfhJA7jVKbiBy4LhmfdUDpxIKS16IPzKriVtIlLSb6roBa5WNCHFta1w/hNQO
	QRuhgUlZkQPe1FA3KcGK+fhuHgMIBBVme1WVybHpEIulFkqfXcqYdMXupUT5IZz/VQcPb6/TTrF
	+aHxsqaGrh/OkikeHm8yQSJjHiryFawldxgrThFY/47Jtd7aI0faQVx6d2ywyhlg==
X-Received: by 2002:a05:6a20:e293:b0:39f:441:493c with SMTP id adf61e73a8af0-3b22ebed7f6mr3895209637.30.1778842079029;
        Fri, 15 May 2026 03:47:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:e293:b0:39f:441:493c with SMTP id adf61e73a8af0-3b22ebed7f6mr3895170637.30.1778842078544;
        Fri, 15 May 2026 03:47:58 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:47:58 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:17:43 +0530
Subject: [PATCH 2/5] dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3 PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-usb2phy-v1-2-5f8338d466bf@oss.qualcomm.com>
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
X-Proofpoint-GUID: bk4wGpimlUICNkwIm-QIUg7bZsv65FFO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX73RB2zZlCBEn
 RonYkKD0v+7og5ua1BoA/G5eeT9Xxt6++Ds7nEqGUMQIQVFJ+vAGrWzmBoy+HYA0hMIk486W45P
 VdWidwbnn9GvEEGrQfNBOWixbGJpY2SCQZPmblLNxItDSpWf6SzyQ3MOEPQJKrtc96dhB4ne/Qk
 5/tCWmYgEMCnJX+W+bzPDbAK7/Oe7Ye4YGrhhd0e0kprwJ0ANBb0MhgAwKAjhvtGbHfTnqjP0Rm
 tDcgxl+z+NQJ2jU1z3DrjKyREW87Px2aA7RkzfMZ6coowGBKWqAFA2lSJt8HE4fPipJ4dEGkPFT
 f5bZmCldzqM9qidqt1H1vIqPQnp0KLtO9dQITM9VXQajMsnl1SQKq3RXmV5Q7FgQDSSSzd3nPQl
 8E8sLZzJE0P1Ok0CST4dy8UO5fOa69+oZ+EapFcDB5Wj6G5+lcrHCyuxy7hqazGYqjzZ8hLSkZ8
 /N+c083EUeEqqUWkmeg==
X-Proofpoint-ORIG-GUID: bk4wGpimlUICNkwIm-QIUg7bZsv65FFO
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a06f9df cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0GDvqmC56tkqaa0O6TQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: 8356554DCE2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37499-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add dt-bindings for USB3 PHY found on Qualcomm ipq5210

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 623c2f8c7d22..bdb80371ea68 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-qmp-usb3-uni-phy
+      - qcom,ipq5210-qmp-usb3-phy
       - qcom,ipq5424-qmp-usb3-phy
       - qcom,ipq6018-qmp-usb3-phy
       - qcom,ipq8074-qmp-usb3-phy

-- 
2.34.1


