Return-Path: <linux-usb+bounces-36827-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAMGCS3e9Gn8FQIAu9opvQ
	(envelope-from <linux-usb+bounces-36827-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:09:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 314F44AE598
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 831CE301B745
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 17:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BCE425CE7;
	Fri,  1 May 2026 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPNOK3Ci";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1fKA0Yh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27247413225
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 17:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655207; cv=none; b=rK+/NUVJDYluHstRbNRdkTzBIiEC9SXwlSPOd38KAsOThv2AFcOSX4dOlwe5ASq1xpwsafuKC3X5c1AHO8F4Iu8hZhQyHyrHnPT8wS8pyzn1MWEQAWxkygno95RCx7Hpq7WqPkljrMvhoaRFzmr2OiwSjPi4+3v2wtz9UHd6KNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655207; c=relaxed/simple;
	bh=tPwt2zibhZ1iKm71VtuAD4bNx+7+5u8go0KRtNEVjuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G1kQbnEHnelp02gA8GggCceuAQVwlWQi3zuJNN7cwTar7uN00rGFg5k/lrEzJjz+D9cysvJmXuTgmAb0mMlEYe3Db7ouPtgq5t3lgACoOEVHFFyHc09RUaWT9e1mhvrUlpQOeqgPqcqqZNzdKeAwCaTEkaB2+iUmm9hb804CnyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPNOK3Ci; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1fKA0Yh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLTG03938660
	for <linux-usb@vger.kernel.org>; Fri, 1 May 2026 17:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cq08UG3/aul
	dFdZC7DVUavdx4NaeoilYtVujt5rmGXQ=; b=OPNOK3CimXiEbGEZjUOKpAOSdWw
	Mfb/ombr1q1M7DxTQuXVkSOBkmULCglacE3icLJ8wfo1bpO68dnvgwMI3whFTiIj
	Yjm5jEYS3nI3JcGrGckWjkn1l/XEn4acUaxvEmWTGvl9s/i50l+de7fNo6RApcEU
	8hgQJ4SIYC3SjikDLcVJxFx0zAaFhtTib1ttYlTQIMQlQ/t2qO1K3senn57qFwnX
	62EM0f3qcoQsJ2rcSYVFX2Rh86QaEHdpefXYTAbb4RpGWUJHM/eWuaTHRraNEsKl
	hB1W+58/SOSBl6vgoKj+Lwy75//5ItZBpgJcAcPRLtt+RoVvpyEbnTtOLGA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvtrn12na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 17:06:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ef37c3f773so483837eec.1
        for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 10:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655203; x=1778260003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cq08UG3/auldFdZC7DVUavdx4NaeoilYtVujt5rmGXQ=;
        b=G1fKA0YhElkNN3qpOkWodjvr72JTM2JZNckk+NJW5Fq1XO3NxVNe8aNkqW4q8+dWMz
         GY1jzJzH50eoWfYO1MI5l4iERjejWmw1/8NxGliGzpi+kedy++En7zeCEEC2Fk4LU5Fl
         YV/KGrbwZgCC0oBV0iifWpXb7zULzqEnC0bVs6/PQ0LnkFvE8SrSwTcnk1CUGuMJHQB+
         9+g2JUDI3Lr/CCkN7nps+aIdeuYnN6e9RwQzfcnrrNOoqGSXW3Nv7HK8sxVLER5oxmlY
         EOeHmmpSeYAb4pobvjldhnyLNE9WfNaPBbrCb+QJQ6QAI4MvDEbP3cfn32JW4SHwEwAM
         s3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655203; x=1778260003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cq08UG3/auldFdZC7DVUavdx4NaeoilYtVujt5rmGXQ=;
        b=ISOnnakshlS7cNhU3P0cFkO+h/8rYAzvMVET4+95A2QKg4lh05/78cvkm4Wpe8iXmL
         qtueDaRFWgMx8mGlYZ7y9Sho/pgqmmSqYGd+yy7dlVHiVjpAxJX7cpUcuJLgCcWnoNHG
         oIpRGaS7U31gfBLXmioRcaZtWiE8KIQkcMjvCY2ywbjG7cm7wAn2DK5jBv+NrjuiOrQ9
         QltWt43OTwG/FHKUeTpAcGAkFvgC7Iow3VYOeXro1aQ/WhW0mT5k5sosUJnCaHOpM4bu
         CHTpxMEq75RhahDIVm9sdx+MpsYTZELY/b90tvGkGrOTAQbO1cPZqyxSgvvqU/7YasIF
         x2Lw==
X-Forwarded-Encrypted: i=1; AFNElJ/nmRa0615TT1kkcC8eY0yyC2E5/g55KwH2J3OVAOgg+571JkCieED/45+3dKYzW7zJ2OAHW9zvdvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXnqv4yP9osTQ8kCOXdGL4oWiEZgxAJX3BMf12sy1kuGKD7QbD
	J9DimJUE85ouT1n80CLknKfpdWosg03jSNHuoZK4w6DeOwUY+FMpP48CPchJwDJ3OxGtuptX+Q7
	9oRAr9o+FdLzxMFmKCO6wfzhPyambjrkKX0zvVswEN8UmzkMIxeZTJAZmLjZWW94=
X-Gm-Gg: AeBDieuVsjJ5c4Ud1i0RzMrYQWDtJGTqRkFXPMwaQS7qMHg2g7D5hoejM/vpz0pLeNy
	9FGNzdPuEEmcLBtr8/AmtU50MSmyNLgRjxy0IpgK6BHDueeAwIWKctJwcWaYbGbHvp1OzmmgU3z
	TnOlPek4pXVzZrlx7T+j70Je4fTlejvkvX4Cp7KbuOeLyJbYopkKrUvgEfDVAjboistcNQvyk0Y
	ihf4Zd0ynEfhpsYnvvwErX+gyc5u19fUdcjcsxqEu666Ga5CJMBb0hJwr2QT/CEKzdaJwkwdZ65
	jaBZr66LZlEFJv5yxepU3Fy0tVhEAFkIN6PZU2OKAzUh1rn2i6brAEp+xiPIFm8d/Ce25vAhlJK
	ifUL+lMqi8K9yY919RpvkSy8sCzpyms5pIQ3HgfhtCAm7IE637FQ7YlIsLDCM/873UqCQgJDPYQ
	ajScyLUIxKlg==
X-Received: by 2002:a05:7300:cd95:b0:2ea:cd38:f921 with SMTP id 5a478bee46e88-2efba28ad96mr83658eec.26.1777655203223;
        Fri, 01 May 2026 10:06:43 -0700 (PDT)
X-Received: by 2002:a05:7300:cd95:b0:2ea:cd38:f921 with SMTP id 5a478bee46e88-2efba28ad96mr83638eec.26.1777655202650;
        Fri, 01 May 2026 10:06:42 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:42 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/9] usb: misc: qcom_eud: add host mode coordination
Date: Fri,  1 May 2026 10:06:32 -0700
Message-Id: <20260501170635.2641748-7-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: E9xM59v2k_SMwQ-g3NFVXHiWdlLyMJS-
X-Proofpoint-GUID: E9xM59v2k_SMwQ-g3NFVXHiWdlLyMJS-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX7HIkz71ItVnV
 Q/pG6e4cYp9gTDPu79Lmy+jyoG432uQirv1XNZ5g3sQNHyYdf/NSwyZOPzZwExH2ks035yzbLN5
 vDgL/2iksffR4CEsqaPA2fFvcYp/wqQXHUa2zC4L2SGK0aDliQAB2wLl/APlnaLxfjx+DuwLWFw
 lzamKjS7tOzpNVLXORnUaA8bTRqJNdZnN2SnJdbCW4+iCXvXUl0OdFpLqPFtYpXLLN7Adbvl1eB
 8TFBPobYXL6+Dg2/M+UzzY9SRHr1zCE3uEcZWpS3ZYdizzFOoBvYT1uxS73QGSgLHUQsKIZJrE3
 0Lg1WgkYJvxa5/Qd62C1bZ/SAB41PqVl0R/PT8K0U1rk6KkGTY4l1cCfPM34WTLrgYSYdZdcSnr
 Qnglr4mjA/+/gqsYhpbjm2g6uPwJvTnBL5Seo/4q7PTFoCkFA9ei2h1q3mdVedNinqW1qcDBwQF
 OZZhNFzrPfR/KHZy69Q==
X-Authority-Analysis: v=2.4 cv=KrZ9H2WN c=1 sm=1 tr=0 ts=69f4dda4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=opDcP0t3FEC8bhoQoCgA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: 314F44AE598
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36827-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

EUD functions by presenting itself as a USB device to the host PC for
debugging, making it incompatible with USB host mode configurations.
Enabling EUD while in host mode can also cause the USB controller to
misbehave, as the EUD hub supports only a single upstream-facing port.

Handle the following scenarios to prevent these conflicts:
1. Prevent the user from enabling EUD via sysfs when the USB port is in
   host mode.
2. Automatically disable EUD when the USB port switches to host mode,
   and re-enable it when exiting host mode.

This ensures consistent state management without creating conflicts
between the EUD debug hub and the USB controller.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 65 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index f656ffc8818a..4734b6307a85 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -55,12 +55,15 @@ struct eud_chip {
 	struct device			*dev;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
+	/* serializes EUD control operations */
+	struct mutex			state_lock;
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
 	bool				phy_enabled;
+	bool				eud_disabled_for_host;
 	u8				port_idx;
 };
 
@@ -156,17 +159,43 @@ static ssize_t enable_store(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct eud_chip *chip = dev_get_drvdata(dev);
+	struct eud_path *path;
 	bool enable;
 	int ret;
 
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	guard(mutex)(&chip->state_lock);
+
 	/* Skip operation if already in desired state */
 	if (chip->enabled == enable)
 		return count;
 
+	/*
+	 * Handle double-disable scenario: User is disabling EUD that was already
+	 * disabled due to host mode. Since the hardware is already disabled, we
+	 * only need to clear the host-disabled flag to prevent unwanted re-enabling
+	 * when exiting host mode. This respects the user's explicit disable request.
+	 */
+	if (!enable && chip->eud_disabled_for_host) {
+		chip->eud_disabled_for_host = false;
+		chip->enabled = false;
+		return count;
+	}
+
 	if (enable) {
+		/*
+		 * EUD functions by presenting itself as a USB device to the host PC for
+		 * debugging, making it incompatible with USB host mode configuration.
+		 * Prevent enabling EUD in this configuration to avoid hardware conflicts.
+		 */
+		path = chip->paths[chip->port_idx];
+		if (path->curr_role == USB_ROLE_HOST) {
+			dev_err(chip->dev, "cannot enable EUD: USB port is in host mode\n");
+			return -EBUSY;
+		}
+
 		ret = enable_eud(chip);
 		if (ret) {
 			dev_err(chip->dev, "failed to enable eud\n");
@@ -308,9 +337,41 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
 	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	struct eud_chip *chip = path->chip;
 	int ret;
 
-	/* Forward the role request to the USB controller */
+	guard(mutex)(&chip->state_lock);
+
+	/*
+	 * EUD must be disabled when USB operates in host mode. EUD functions by
+	 * presenting itself as a USB device to the host PC for debugging, making
+	 * it incompatible with host mode configuration.
+	 *
+	 * chip->enabled preserves user's sysfs configuration and is not modified
+	 * during host mode transitions to maintain user intent.
+	 */
+
+	/* Only act if EUD is enabled and this is the active path */
+	if (chip->enabled && path->num == chip->port_idx) {
+		if (role == USB_ROLE_HOST && !chip->eud_disabled_for_host) {
+			ret = disable_eud(chip);
+			if (ret) {
+				dev_err(chip->dev, "failed to disable EUD for host mode: %d\n",
+					ret);
+				return ret;
+			}
+			chip->eud_disabled_for_host = true;
+		} else if (role != USB_ROLE_HOST && chip->eud_disabled_for_host) {
+			ret = enable_eud(chip);
+			if (ret) {
+				dev_err(chip->dev, "failed to re-enable EUD after host mode: %d\n",
+					ret);
+				return ret;
+			}
+			chip->eud_disabled_for_host = false;
+		}
+	}
+
 	ret = usb_role_switch_set_role(path->controller_sw, role);
 	if (ret) {
 		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
@@ -424,6 +485,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	for_each_child_of_node_scoped(np, child) {
 		ret = eud_init_path(chip, child);
 		if (ret)
-- 
2.34.1


