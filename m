Return-Path: <linux-usb+bounces-35561-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHyQDmp9xmnwKgUAu9opvQ
	(envelope-from <linux-usb+bounces-35561-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:51:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF5344955
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CDBCB30356CF
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594953BB9F4;
	Fri, 27 Mar 2026 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEy6DQQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8PdNzcP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7163B6340
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615907; cv=none; b=MXhcJsDeAB6Kd6hdPfw82pYPvPumffCqksm9IEReFpSq0JhB4Cku6HHHaWuKBXGLa84C32hMa5n5r/3Jnb7Djf5WdzU0UX7gzZkRpvH8SDhBLnC2Hlsb4u1ixU5/zMWTvAT39pSouBNoE95l2XTu6sX3W69XN1pa/yPB2w99XiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615907; c=relaxed/simple;
	bh=K3xNzafka3xiJcudUHpMCrqQIELa5zT+lr5VDT0hF/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Tc6Ln+pxeK8NVljPLHilYhHxuUfPodF4FOcgQWAdkiDvbG3wWYOKzYXgGaaEpWWD3CiXgQN/yiSOMvxw8Nr+4oZvq9cZOPUL1wROPe+SN+/6265taoAyguMQVdEUTSEKE42mPTzYrEcM5alciY714FFp/qUgKi3bfNjJgL37kks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEy6DQQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8PdNzcP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wL773718198
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e5fagU1N8SY9m1K9NIje7G
	6v+BVL6SsF8Rp4VL+0jtw=; b=kEy6DQQhcs/UnrfKW/Cz7dzorh6FeIsEAHUtsl
	X4ABaDQV0ef+iNIlFoZNOVS0jZcSrWo8y/7eeljpyjnz/ZLVDGa579mQ2tK/4cwl
	4x6oxo2n74RbZZG8ODnRKCrtolt1HpnIgqHZqb1FUkhUFvBKJsbdtQ4drlx3I+WP
	VS++Fp9laCXj+Juh/3skrBFINVwTa8dnkf6uGdxJh1HyOeSQOCodSbWDyzd1oJRU
	XqLkC0eHGZ+KaG1L6ItxrxGOgIZfYr72wvTYTYzC73fNWnN1PDy1ouPYo0BjMZ6p
	Sl1yFrsvGkH/r7V4H6rqfa7m2vJZyqmHZ9NjLzJ2gCsVZA2A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6jsg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:51:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091782ab06so98664891cf.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 05:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774615905; x=1775220705; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5fagU1N8SY9m1K9NIje7G6v+BVL6SsF8Rp4VL+0jtw=;
        b=G8PdNzcPw+BZG4lNNkj+KRYNHsDHxyVxrrBoGk5DXzsblL7xHgZ1gLwQGEBzjv+rrw
         0Zc7x19N5kkdoUmk4B2I9Zu+HWvHuw+0Ff765nC0SqYsaXJnL9w8BwitbPds2LAoMcA8
         X9kvSlxAoz3LTh5qwYeOI2AhTe0X1+1DIKiTGRo0FKbayD2pal3lTXKcgBcPm1mIdMvr
         eoBojn0DAlMw1ihiMqdXmIzbFon5lK99pdeh8pGf2wkfjZugTvWcWNFy9bcREZS435St
         HjGVDRfn+Ug7Fet2kvhnA9RGuda5LllMER1lOjDkjaX6ASGQcS9I+hRMn3wclvA/FkWV
         FwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615905; x=1775220705;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5fagU1N8SY9m1K9NIje7G6v+BVL6SsF8Rp4VL+0jtw=;
        b=P2/hNX+BWuaLmNAHtdGqCsv5DsvJv7z0JE9gA+P7JgQi+mfSZkF6QYJ5K7QfHQfhQk
         VyH1EkA8M45Vcpg6Ybpded4bEFM5fAgsJlyxpijsxBOcATCUraNkDPZYPyrfotgVVj3F
         D2y7ClJq48ZVZIVF6ZTuUAUwiKGmMZ1fqdpYF+noXGHKYw4gCPUdllhDmzJYRjsRGGhA
         D0RVRSZfKCaccENLgL6tty4y/mQppkdHNvNdoYyJjdasAPlQmYb/Q5V0U3wZscSGlN87
         EoZSLc+O3gkDJxJBmVF1JgJrZxn+LbnmBosb8AeO/1RiTpyf64xOKPg6Du7e0txhg7sU
         8Puw==
X-Forwarded-Encrypted: i=1; AJvYcCWECo8Jv5AHZYe9NwG+O3lWT41iSyh9EqVhIohTdnk9LUdJzRVQQWUXU/HlwwzFRi1D5l28MjkgyFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4l5lCeUd/3WJz/BP3+FKUIkajReiyqlMVqlaikbBGOgwWbgzj
	LZ2xr5jr0zsoOSha/XDK1cvUmyCu76vJOkc4nALAzXg+fZpjgq2BcO1zTV5nOiJ/p4r6RGwrvzf
	12+HNNLKOWcgWSywiKc12VfUa6xuN17t9awa+Sj19tSUGzKXF0vyhbnbFHkdaC+qAb3MC2iw=
X-Gm-Gg: ATEYQzyKLxg/x8AlEW7Av45V9oNvy6BaKNPRBEPudsia5a0S8UQn5IhyzQW5+CKjwV6
	EIjeXosyH2yEMoq7sDfszdH8PJGavot3EPiwP7dm0EvT/XU5HVSJarUFUVBqvwoory0xInrqhS+
	m0m534EY7QJxB1TTsR2+qT32jS6Pblm2XIYtY/xoPCP439+wc2BSPhZjkqXJtjiwffL1wUyJ5jb
	nCvuSUNSuRwvqjPrK3VhiC2i0HgNOmWS9aiyqBEFyCOv+VReGO0n4OyEXcImDPerkaPqoQO+JcM
	pS3wLkTp0PvcuwflrFT+U4ZQccvbWI+0C8l6NN/X74Kef5dyjliFXwPrjPXAnc+hPEkp3G4HO+l
	tZ+pGzF/DaPJkJyergPLh+5gzMvk=
X-Received: by 2002:a05:622a:1244:b0:509:439f:adc6 with SMTP id d75a77b69052e-50ba37f5b5cmr25401941cf.20.1774615904821;
        Fri, 27 Mar 2026 05:51:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1244:b0:509:439f:adc6 with SMTP id d75a77b69052e-50ba37f5b5cmr25401441cf.20.1774615904274;
        Fri, 27 Mar 2026 05:51:44 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df85csm20781507f8f.28.2026.03.27.05.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:51:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:51:36 +0200
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Document the Eliza
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-bindings-dwc3-v2-1-28439482ebce@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFd9xmkC/32Nyw6CMBREf4V0bQltEcGV/2FY9HGBa6DVFvBB+
 HcL7t1McpKZOQsJ4BECOScL8TBjQGcj8ENCdCdtCxRNZMIzXmSClRR6/Eiq0Bq0baDmqQXNVQE
 5yPyoKkHi8u6hwdf+eq1/HCZ1Az1uV1ujwzA6/961M9t6/w0zo4xWXJmGC6FVebq4ENLHJHvth
 iGNQep1Xb8ZNA+rzwAAAA==
X-Change-ID: 20260318-eliza-bindings-dwc3-4b6e4ea45b93
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1829;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=K3xNzafka3xiJcudUHpMCrqQIELa5zT+lr5VDT0hF/g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxn1dKJc/zJzaa/3EEQufD+LPMm/E0AnRwmsSj
 ipD6l8NvsGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacZ9XQAKCRAbX0TJAJUV
 VjObD/93pNNLKYp5fF4v7MjgX4oeZ/EmydJK48uAgiMHRpM/xtgWX9pCp+ecdVtYZ4Kf6bOLf2I
 j+zj5IfybYmV2Ic9g5Lk24/gDjaZLrXvpGn6Z2Iu092t/qgQ5G3o7tRZN6XRvTxeEDS7fA8KlHy
 HG2zcNBdB543g4jq0RqWWOiZUQ7YA4p9N4FrVJqBHG8WOXroQENgUSumjQrZR0HvmgW9vTH6zd4
 QJshCpdoxixiKeeYqzJWd0OqcMIQb1wcr7JtEqa/K4Aw2a787ClWoK2V+mPYPfXLEC3mI6NItTd
 mchsP1M0cfyfZ+8cBrMUvThIdCNO9CGsm5TFev95aecR4u4FKS4hEOhXGm60NJMtlVms4Fu3f9+
 JPxY0fEfJ4yAanVw1Rv1cFJV5xykWokzoXZB/1r/bbET6uCEgCjefMKo9/OBodNC+Z/TJhN1/BZ
 JZtevFY3mOoPzPdmuWcdGeBTUmt+rollRs2eRu4eJcjMxB7MxQRu3J8oTTtilIcC/SSsXV/E1V4
 kyRwvm98H3ID83xjkmIKy8eG/IjQE+2VJuYcua0A1VJ+/hBo4FR9AhvhODR4BH6H7aEe9D4nw6e
 l7Iz2RuUTN4RsEgDdcadBC/Olv9vMnj8AO0K0IIk1Dr1562uk8hPAAn1I4GJ1Fzg/kGKIn7UqZm
 eY1JoiF2Fwfi8zA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c67d61 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VBHLH5VKHYG7obxZQbIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 8gSq1n9Ds8X8jfdLv1k-TZRLdCfXF3mh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4OCBTYWx0ZWRfX09WyBZHFmkQI
 r2FaNQDIF0+3DSRp0ePCa51iBBbjefs8+pxjm9Ow7gQsClqzUXh4JwG6hAE9ABBH/bjI0T+MyNY
 gBR1RhxlxATuLpczlnC4w8lKre7EZMghnzQsXEOsM9GWov33SShvckeIKkF5s1IVco9gKpAflYs
 kHjJ8CirCnJMlSBrR3hjp3zw+k6U9XnEb85oY+S2OfjyU8ZnVgFJG5wInNRkHV0cmvB4bmG+nyb
 cnzFcPrzbv564mnuIQBbsXW+0aALu1zG3+7Ipkc1aFWAXmBhQ2yczaG4CdPW/egytvo+YNknOSu
 h67isKF9c2g9b97fDILxCX5ZvhbYCi+Vzv/uL6kiK4M1P0ebTKyXlc+rTICZMMWRsSTa35Ncgn0
 At6VUDpS9Q6ykBkPr66/r372qIdiIdToighnZjNNFTuuThvy1wgC+2tnpDLnA2j1ZRLOfDWArtO
 2oLoyUlWW5GX05T4jmg==
X-Proofpoint-ORIG-GUID: 8gSq1n9Ds8X8jfdLv1k-TZRLdCfXF3mh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35561-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0AF5344955
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the compatible for the Qualcomm Synopsys DWC3 glue controller
found on Eliza SoC.

It follows the same binding requirements as other recent Qualcomm
SoCs, so add it to the existing schema conditionals covering the
required properties.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260326.
- Picked up Krzysztof's R-b tag.
- Link to v1: https://patch.msgid.link/20260318-eliza-bindings-dwc3-v1-1-92bdf233cb87@oss.qualcomm.com
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index f879e2e104c4..e67a967c677f 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
           - qcom,ipq4019-dwc3
@@ -346,6 +347,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-dwc3
               - qcom,milos-dwc3
               - qcom,qcm2290-dwc3
               - qcom,qcs615-dwc3
@@ -507,6 +509,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3

---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260318-eliza-bindings-dwc3-4b6e4ea45b93

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


