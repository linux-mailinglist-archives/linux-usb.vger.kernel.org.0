Return-Path: <linux-usb+bounces-33377-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFwxBbT5kmlx0gEAu9opvQ
	(envelope-from <linux-usb+bounces-33377-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 12:04:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EED9142A05
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 12:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18F8E30164B9
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 11:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F54E2BD031;
	Mon, 16 Feb 2026 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7oJg+2a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4sM2m0u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971524A047
	for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 11:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239853; cv=none; b=c+yNvByWwye9Xtnt86PE58cNZLsa7wNanPxFPnKW+ZoVsmC5YGiLwBsDKEXkjnUknV/8Fwl/ELl36M51o9hO33J1+zNO+N0pqwp1dQz9z64Ojq6fuTT9BMO0pdgBiZycZQZwqvTjLjn/BxKhM/A/vxYtpop/AWuaOkq6kvZFLBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239853; c=relaxed/simple;
	bh=Eeac04LrnMak/6uaSJ2sb/4jE0PYjHzocse9Gn6E+Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Log1oy3FwB0M8G/opLCAZM90W2T/oPxJLO5MiqCZ/p8CTZaXcARFIEzwMtgEkywj5TFQ3P696mzfLP5GUvkAWIpWZ37zYS3ioFx/Cg6zue1BCQwfSjaofYUf7yXHuWj8UkeKYNnQAG00C/XSu7QHL2jE9T2854nzm35aF3KlRQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7oJg+2a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4sM2m0u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G0uJdH2893864
	for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 11:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TdsD5lNbmTsNeyD5xIAIzf4HHSESAd7HqAZ
	gWLfN05w=; b=H7oJg+2aHUKrK5KyctJ2hlY1pZj3WqWlgnPGdNHf+yCGAUmMNVr
	O/1pGacdRdrOuKcQnIdShFnAp52ArxP+1V2xOTXrWb+ecut8OSCzZ+qs1UFz/13K
	jBZH1eVNoiN407cAxJ8ENseXH+YrA6d69ANT3Jr41486CMhbPNDdMzEVjjeckzj3
	d6WrhRS1qYKibVtS0U00W0J33CQuQ2FYWMwAdRPkpeOLdcwxgoGph1Y+TLu7QQuU
	Hc12m4euTzggC3sqLs6UMSFMmp1RcxgWw2uobHU3rOVtXj8xEryeaWBNa/QEZD4V
	Q1Ev/aKecXxLBlmCqYqI7tCct2R0wpKhWRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbfuw1va2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 11:04:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4e37a796so1299532285a.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 03:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239850; x=1771844650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TdsD5lNbmTsNeyD5xIAIzf4HHSESAd7HqAZgWLfN05w=;
        b=S4sM2m0u6Q/+/VZC91ZXCke0zkH+QJDH+7UwzDvt9ELnyI8Wz0ghucaVVkShoRI96s
         BXokLMZh44OrLo3HN0aS6KVsKGd2VMjPNSVsTSwEPl3rCETzQozAx8a7W351fk52RtHu
         gaBptfgzFGhn6LZe7E5EbD2FTCvgqqoxSMb+u4fVbw7pZPs9Ai1I5xgJqqpfyhubmUVj
         tFBUsBHaxb0/1hrICNN01nBhyKb7OSmCqyGqXI8nUC3F5p17p44GUnRy42WlpaDv6E0D
         uKmBubuwUqNYQu4/5hM6dbfitgJcdqUQfSEduRC9B3TB1LPmz4McuilpW+09h2nDmhEV
         lk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239850; x=1771844650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdsD5lNbmTsNeyD5xIAIzf4HHSESAd7HqAZgWLfN05w=;
        b=JOLwVgI0Z+V4BU/WUl0eGHvIzEYnIsSJvC3+5b+bidO9wmstbFSyS3sMh0sUu1xDbC
         BuYV/+yPbbhHkekB7XCym0an3ZLPppE/OexzbLXEYWgnYg4BR/i5PaCL+Mz1sXUo6w8R
         WfVMf5YkYQDQcTsAuBYnsS4WS2CXpkYS0dckBMAknXcK46qEDOg3//PBi9cCDCGHXvUN
         2Tt17Lcor+qOusYn+3VyycA6sJeO0UOsXUgJw/rJM9W5TnGXlqc24D2xwUaq3NzW8ZUw
         uzmt1fzQghZSR2tmGgwOlDJ7Rjo/lGxar5q49MykBQk73JuU107nblpcZnxzzZlMJP3h
         bIzg==
X-Forwarded-Encrypted: i=1; AJvYcCU1sc4Q5ykAia3/mH3h1s//kQTLx7WI9eDzq/ReOCBEHNnJV9aZuvXLf0zLv25K/2Cf1f2PQc6XY8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8QEoA8/YXvmdh4L2TuXvFj65Gxjew14cfm9HxCiIpaNQsZyrP
	iKLXDq0NjVWE53kvogi2FZ+GEOskBdh6xWok6QEYgfL9/KdFG4BgEc5NSmQllq7ODbVLI164tqd
	qfAAofz3TbP12jUwoQgkj3Svl8Sv7XueUfqAvx14m6QrS5qTsTikfyXTUKc90q1rsOWHbJSI=
X-Gm-Gg: AZuq6aIp0u8dOCzNQjnVM69Jd6R86qvP0tYNcuLltg86w/kDDFqxW7VEvx0et3Da8tO
	QprGiLZEt0VXwjTMxb0LKtyP4z/WIvrRET8F0u50GjwiSvaWZWYat1S8GgWtKiUfPoOeKeNtXx1
	55B7/vgDFmVOfJ8ASuCEbOIRAjlhtEuPacEAij7Nw3vaKdHzjINpQTHjJu5mJihD7z5AKLiUD6V
	pR+M9Q0N/8o9OGCtzrxQKcsUNmUN0d7LhIg+xiDgT+yiSJWIhKhAjMnWRnGlIIicQszWDPHFfjh
	R105pGBDy+VkNPTouD70UKGZsDdgf9/5aSahzvbPrM+MBmzwe/5zArvX1I57jzwcYFndm1ufsTR
	HbE7Q+4PwdnXwx/pxkiOva4pyq+5Wa/mgiyfyvQ==
X-Received: by 2002:a05:620a:6cc2:b0:8c6:a341:ac1a with SMTP id af79cd13be357-8cb4245b9acmr1289864185a.52.1771239849598;
        Mon, 16 Feb 2026 03:04:09 -0800 (PST)
X-Received: by 2002:a05:620a:6cc2:b0:8c6:a341:ac1a with SMTP id af79cd13be357-8cb4245b9acmr1289861485a.52.1771239849132;
        Mon, 16 Feb 2026 03:04:09 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a4e149sm123943615e9.2.2026.02.16.03.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:04:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Badhri Jagan Sridharan <badhri@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] USB: typec: tcpci: Make tcpci_pm_ops variable static
Date: Mon, 16 Feb 2026 12:04:04 +0100
Message-ID: <20260216110403.159945-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=889; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Eeac04LrnMak/6uaSJ2sb/4jE0PYjHzocse9Gn6E+Ro=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkvmjYq6qaJ/fh04v6Sz7ESiVb7VCIXemU1RBb
 vDVUpriEDqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZL5owAKCRDBN2bmhouD
 13Z5D/92H7+dS/QbRyDUyIOtTtq6kd2pd1pt6PbTmph3/LyLFqKZLO2JrCK0JHz42+Qrvac6uC8
 n/y8GOTLLGexYeNI+q2/ufyTfNouDFdWD1ObZ7klBHhSyWqLJbmbY4t7C0vpBYMlgfQKdV8bNDe
 tKu9oqnV4UiCBCvyzaOU8ROZt+nbUizQnPTy7xIqLyUWUSpZBqlLXfQ8uqyimEa5zJiQs1zc0L+
 85NHnI6ERkbnv37gw7GWZiHCfcdzAA/hS//EIM6kgUX9ON+rOee8boXkO3tyBM3lLT1UL5ejctV
 WDgBivWdKKkZ+ttpxhWQrUOAkWUcj6c94wL6W9hQPvPvq11RLkI2k77UDcSFWd6ymTNb+UiU6L2
 l0Dy11a8fW4T7KVuQb2X/+kQOSF3hj0viohTSuatOQaQVBjcOheBpLgfPr17JnoIKNkosE5aLN8
 nHdyV5vesMhgNwV5cCigfudWJu0rEkQ0w9mQ7lOCuVr2Ny1Bl4tIRDqTch7mZuGRkEROpuZbGS4
 x6JdrvYS5tGSUGQlBBDRtLbMCD/4OBRGPgWK7QNgpd40vgkq9d/05XTrpYrCWPa+aZmBxOMGdIa
 pEtVZl0t6/ECYLrcTwAnhJ+A53dfSyCz9mTxgue1OdE0dILtDyoSYTQfwAN+Y2rce9+pqCAZXne LaykH3Uaa0Ha3CQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jb+xbEKV c=1 sm=1 tr=0 ts=6992f9ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=9MM7AVauckQ5hBP9EeUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: rnSh7PKoE6z5HveDMtLYUczsXswAJVEw
X-Proofpoint-GUID: rnSh7PKoE6z5HveDMtLYUczsXswAJVEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfX/Yx7saX9G2DO
 Q+TgBenK2q8BcFm1PbPFX+wb9iF/HDlAgoiBjjHLM8WB06O+VK2EKvFYOTooUDQcT04rnGZ+G7p
 xMzU5szWtT+FDUUl9xfqZ18j8yZZ1GYVLNbSBmBMyJQVlOcOw4OfuAD+KHpkzyWXjkjqG82hpw/
 xQxmychaQWeV/1l1enrv4Py0tlGmPYB4tWolSVw6i7LyPrW9F/gWsuto3hcaPvcxfQSFMYOz6yl
 9ghCu8TFw05KB65CeMFw9qG1UnPwrVOScEyc4H0y0mexCZGDNS3N7B9C99WsMR3sD3cE61x63h4
 CpYdhiOQJGc11+ugu2gcyV9rF6EgXxttlJpgSpUt0ndaHTelTa7+i89ulsBeigDl0tIAsWDcP38
 okZBbe/JqsuCLoX857UzqRFSQcfVoShIJQJs4GGxN8H/CjhIEEsd43ta9jPSQEfHz518my202Bf
 OOrTqexERhCFWUVFU/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33377-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EED9142A05
X-Rspamd-Action: no action

File-scope 'tcpci_pm_ops' is not used outside of this unit, so make it
static to silence sparse warning:

  tcpm/tcpci.c:1002:1: warning: symbol 'tcpci_pm_ops' was not declared. Should it be static?

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 2a951c585e92..8b7e6eb92ca2 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -999,7 +999,7 @@ static int tcpci_resume(struct device *dev)
 	return ret;
 }
 
-DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
 
 static const struct i2c_device_id tcpci_id[] = {
 	{ "tcpci" },
-- 
2.51.0


