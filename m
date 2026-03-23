Return-Path: <linux-usb+bounces-35312-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFsNNtj/wGmiPQQAu9opvQ
	(envelope-from <linux-usb+bounces-35312-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 09:54:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB4A2EE831
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 09:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D02E530182AB
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 08:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5F6385529;
	Mon, 23 Mar 2026 08:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKcAuvrY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFQ60tOO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5C9382F1A
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256069; cv=none; b=E80BvULF3YncuuIydQOpjLfEAsbhI6XQxrBHvFGxh7OPaGxuYPGMl1xXNmwyTsyOQGiWejDtZ7sDxhinKeH3eH5DCnm+N4RVQ4WwJYPaDsm0DWWQVsHM9pttDV+eeLDy2kTQevGcA19nMDdF1LnpKyZqIDOc1av+mUMCyX1QfiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256069; c=relaxed/simple;
	bh=IWg7Fq4uiHk+iIE/mg58Tl+eNsaNW7if6QcneB+1peA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gihOX0OfFTHEuOVQtenvlP3MrcMCbClxHg1ZGs5WN0N8RdUuAbqpadCY4Xh9LCgIdbIt6g0cmD/L12UuDFVYvxlE6SYKso+Kxm0g1FC//G++Wa1iQf24KzLSmLVAK69CcGP8q1lgpva2lynmCxHHFzOawJ11anXPvAc2ZPjOFzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKcAuvrY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFQ60tOO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N768es1497563
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 08:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sEcniXN4CmVf2S5jjfl6bW
	59q+mApatBSj6Rx2JSu44=; b=cKcAuvrYgpSZ7Hb1rFspuUKBKDQQKKydTFSVsH
	3K4JQJNUIv+zJzhyclz7HbRCzoMWoa9Zdj7Iavp7yhnxv/P+OoPKskzaDjy4Nfbr
	6Zd+GIXxuFMRe0OJE+jbganVuxh2nC0tHyJXQ9ueYUTb+C9qFuz7ljZzaK4FswAv
	Y/2BaImMUb4EQHEgQW26ST2SkK/MT4f16VreBhmPj29t8FgXRV/VYhWk1RveG7IX
	O3aYImO2MijmWzcz4dP0HtX2l0pF7sGufdAF/fJtYjb+nQXCEcWPdPuMgBNLl76B
	0PBUIrf/f8CNJI1qCCo+0GoAmtSz4huveHeIUpRRNOoNzzFg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghcenw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 08:54:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31cff27fso23750201cf.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256067; x=1774860867; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sEcniXN4CmVf2S5jjfl6bW59q+mApatBSj6Rx2JSu44=;
        b=jFQ60tOOz+M0yajazoO9gn6LY5Mmoa/G5yLuI0l0ra5a+EZwBfrkXw/qJUCczvo5Zb
         phrii6myzigSy3cEPg5Emnbz57yTPpsABru88mFWrY8yltBMkEb9DZ/BKEi9IlLEUXLY
         sfF2S2CGDt6Qb7ofWYtoakN4VSrGYxRLLKEBkvN7q8KtAA3aDSCvwgdE30aTJIoR3zqA
         +c9Z7UBZKAf0FS2y8jT7LtS6vvjEqw0dZ8KFkfxp2CDALHIhn9mWZ459+BwLwv2CSfbp
         qyyhG/cU7Y5AQBWPazAMVukmV3GSjDdxilOJLge8C8XB7GEa/R+Jz2n3AQZTvbf2HITW
         7uTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256067; x=1774860867;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEcniXN4CmVf2S5jjfl6bW59q+mApatBSj6Rx2JSu44=;
        b=hg93NuGWME6pLVMO7PNAze00fOjgooNjmHx8SLkX2bt4f8+ohYPy5ELIXbkToQVkoH
         5UfitG2YrB8fX6KUVzNrxn67Yk5IJ6B3ZkSQ+LbfVboz1klMDuYrU//mh8xpMdwj64Ye
         56NBQbmxgw90cLvGdxYIof7dS5wwktfjuhIVznNccZA2WL26n5368qTGMVEaRijrisJO
         e16f4NgX2Y1NfU7UdKBo9TeM15lmSILJP25drj5pFHDCnEDp3pYpDUMDUf3u0pJEET+V
         vurQZPqc4Qy+Eg/CsEGzt5FSVuJPpjnSqZDeUhDBW3A+xdg2MRU0HmyrpgLBoYYCtyh7
         b8RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaNwB0gDFJPFIo8+eAPDOrfHSc7znZf9UDkB9g2YlZrap7PSah8CrCOs/uA+vQOf/wjCjchXhYd2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw26KLZQ9kTuNifiv49QF1SEjmdY/II8iNlCjKbGQmVSGDQIbS/
	c+Hsqhropg6PwLKJF3l5iSwtStOfVNdSmOR04bonf2eZOEpFwKDyFeH8W69K5Da/ue2YKB2F6YB
	UNqR7ZdH+znr7NHK4Mp2NUBHclRJPTn+iR89obNYa02InwCy+JHNGgM73XDG7xykwbonlLZc=
X-Gm-Gg: ATEYQzx9cZfgWijO5f4aL2qTSN0GdBafLXDSPHiUPdeZ1chnGmLExEFHg1LfrBnes63
	VP0BLAhJKap/frHgnNAsnjL+pqaYn+3Q8ybtLSVF6BnSL4dArKCJabnPNXUop2OlZ7Z7kezGGCW
	98b6M6Ae513TQmb7gu9J/0ERhNu89nkObTS+KL0R+yh+VHk5m5QsPjHz9+7OLu66OIxwulxrrRK
	JNosRKvZ4O0sEnnLGTOhxcwh46/5LOHvBnx4Bwp9pdISHZvpQ3hO1QHDqVHtrfRr3ENnGJmonh9
	DwG/THg+oax7PBamu/RFjfByv2fbgvDS4LbznvCnk2stLAnPzta94rv+bG7J6aK7LWLQwTJJIyg
	bMYWDY6/MWFWbvnmd7zoez8B3O1LiSfW1ocEGmHhqcg6X
X-Received: by 2002:ac8:5f52:0:b0:50b:6a80:ec17 with SMTP id d75a77b69052e-50b6a80ef20mr1491401cf.40.1774256066683;
        Mon, 23 Mar 2026 01:54:26 -0700 (PDT)
X-Received: by 2002:ac8:5f52:0:b0:50b:6a80:ec17 with SMTP id d75a77b69052e-50b6a80ef20mr1491231cf.40.1774256066252;
        Mon, 23 Mar 2026 01:54:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm27911739f8f.18.2026.03.23.01.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:54:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] dt-bindings: USB: qcom,snps-dwc3: cleanup of
 existing bindings
Date: Mon, 23 Mar 2026 09:54:11 +0100
Message-Id: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALP/wGkC/yXNwQrCMAyA4VcZORuoLQz0VcTD2mRbRLPabCqMv
 budHr/L/69gXIQNzs0KhV9iMmmFPzSQxk4HRqFq8M63LviANGMUJdHB0DQbPtP0QHqngOnOnS4
 Zw8lRe+wjsQ9QQ7lwL5/f5HL925Z44zTvZdi2LzC03RWGAAAA
X-Change-ID: 20260323-dt-bindings-snps-qcom-dwc3-cleanup-390d61fbde23
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IWg7Fq4uiHk+iIE/mg58Tl+eNsaNW7if6QcneB+1peA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwP+4OC4cTz7PsEXOkFfZ01wSxGTI/CQNraAA9
 rO2mF8emAaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacD/uAAKCRDBN2bmhouD
 19eFEACbMsXVDHKisEvwV5kaxElgVAPuJpxX/j2+HBcdCXi3HnO6SCluHFrCLS8JhSejqE24lSz
 b6PVRsQrxFEmJI0XstCivFUcaSQOHoOfpvwWYAl8I3sGscxqPRgOZMHOTjFWJKV217PiFxfI8ud
 gq6IiFqV1Gi0XfH3kopTdS4ebRAHf50irahpBVYAAhrduP2ztTowVeg0VMzHBB4EOnwotADdOYl
 AiozwI0Ng6X4v+vgCjQAmpRXtasJnHYaA0vXixpeikBAebvdViprmF3eC9UAss32C/FkdCcgasm
 781TjXL9B8yBJxRjvIDA22Mty2ky7/EQlt8eCLgEdPLNZl0Pkn6LgkyJKC4PMjQjWlW0Id8mWtn
 ARnP+5Cf0yvAcg/b+K0uZvE5Ecnavodv0jhwQJGBDohxdQ4TcmpWVeGbQNyb9Wk+E6vZ7AjSeMI
 NdA0x2VTqe6wrsZf9DM1k4Yp+zfPFP2JKIYewbiXMBSzkssltKwJpx68fjVsl4b5lu1/bhQqbB8
 ppniGuS49WgFAFaUatS/fI6Zs8y2gnHqu1DYMSC6mhcZlqJ2GGQ+giFwOCDnPgSDsKTWLeLhTBf
 qgZXpNoNJ+RG324DG4tjZ9H8tWxUDvpbYMZlGUPFw+gQb1Y1VCrxZKkzUtVbJWSCZBljLJGaGFR
 YB4B4umwszJWXDA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c0ffc4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D-rwtq3xYFyqOEHTDRwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: UOJt9sLVMxJO1FoQHMd09wHs42RHgzNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OCBTYWx0ZWRfX78Axk1vT8KNA
 ieL6uLT7RpEQFV4J40edrATlGCItnSbO46wrnHMja2jVEn9KZ7/YyoHYFPt0Wb2jvHU01d9oib9
 MHNcOC0bvcxnOPsF+PJcvB5cec4EGQxBgCcQTzD2nc9V7jfHsllxFxiyFqLmb1pEFFuJYbWiR3e
 ZyMQIBnNqoKKw0QmYaxM0e6alJ2CD3NDoJwUsvdgL7q3DjJtdB+cypZ0azB9BVF9c5bJjoAVpSS
 3/34ZTdVh5xphnR4guJ59RKZ4WmVpuM7OswsvmA1qOAvGwskHT0ZLXLMhhJvJyXGLaLWm77sGcm
 QHRuDv+Lk7KalhJ7z38JE5IzGIXl+xpNkhzJBLYEB9F1tjXa+Kj00e+lw9Lsy9nCQ3TV+d+hK7n
 Kz1cbJ+5wZ5cy9vOg6uNbvLC1C6AkWw8wHGRvC2DMKnoNmWhdIn2ivCNRq0fco0JP+ww3fGSSY5
 z71FhprHaDhOJZyflIg==
X-Proofpoint-GUID: UOJt9sLVMxJO1FoQHMd09wHs42RHgzNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35312-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4CB4A2EE831
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v2:
1. Three new patches, combine previous two into one patchset.

Previous postings:
https://lore.kernel.org/r/20260319091709.20981-2-krzysztof.kozlowski@oss.qualcomm.com/
https://lore.kernel.org/r/20260319092348.35237-2-krzysztof.kozlowski@oss.qualcomm.com/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      dt-bindings: usb: qcom,snps-dwc3: Drop stale child node comment
      dt-bindings: usb: qcom,snps-dwc3: Add missing clocks and interrupts constraints
      dt-bindings: usb: qcom,snps-dwc3: Add constraints for SM6375
      dt-bindings: usb: qcom,snps-dwc3: Add constraints for SM4250
      dt-bindings: usb: qcom,snps-dwc3: Add constraints for IPQ5424 and IPQ9574

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 36 ++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260323-dt-bindings-snps-qcom-dwc3-cleanup-390d61fbde23

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


