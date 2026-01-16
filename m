Return-Path: <linux-usb+bounces-32440-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9965BD389C1
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 00:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D200A301B89D
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 23:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B7331B800;
	Fri, 16 Jan 2026 23:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXB8wg6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfc+R59n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B54A31DD96
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605680; cv=none; b=Law3koKpmEua92jjvRp7jDsmHuN2tk3cudlGhbgAvwl5GI8EyrOghskuqUeP4K+woZYcJMxaTCb4hg1gpMyFh/9WTieeAnNjdSYhWVckYp5I5NakuWrwiqb5UzZNd0jsdJAmSbLJm0zYjRCGmxzyid9X8Jt5grtlOF9CxRJGFd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605680; c=relaxed/simple;
	bh=r1bqX+YKzW7Wo7iz/2rkXvfUlo4SFKFYbrl1Eh5BoSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KYeSWJpN0h37JMsGI5k9kOgRdjVMdR2OpnOLD8d1g7pNzPbrR8I9UNPdNTThZxqKnshbyBrCnz/WlhYcRDFlRGRqYHKGL3fmmZqCOF/WhT0L7ORSozzNW4iNO3t/j4v2WZglZtPW+Js90+CaE2zhnwTOom+ZlHLfI0mO754AHlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXB8wg6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfc+R59n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNCurx3382906
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nLNoInJmlgi
	CyTSp0s0aDwUKBeAC7fdewIAWrT/v+x8=; b=RXB8wg6M1UqjDyu5uY1Jpz9/GxI
	hrey0kk7FfZZrAqcc77EesVLivRtsdSP3Y+UH+uTOgb6ue5tUVpjBw8rePqNQAQh
	BGjqRQM2KKMaq4Lo/Bf2Q+Za/H6C9ziZKuwkFWVJBkVLDI7eI6JiDBGrXmOLiiVp
	QEG2CAZi/NrilZPFmEFeSvcXrvLlBR93Ns1HbpnrUDCh6d38bTSPVd3YDPcXfSwY
	4ES7HOOPeO3mqyjvHz+28QS1/4Vg7I9tN1UA1LbOZAPPi3pcyC8jfvKXLMxxGCDf
	F7Y+9Khm/2uN/va2qcr/4v4qkKt1wgDa+LXBpdID/0sQfxC4g0fmfdEc31g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvj58aay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-123377038f9so649274c88.0
        for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 15:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605673; x=1769210473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLNoInJmlgiCyTSp0s0aDwUKBeAC7fdewIAWrT/v+x8=;
        b=dfc+R59nKfMeRZv+Jf0hT6tKkSc0cdbC+4zH7dCtSy214k69AM/wczyXzwz6FicgDS
         iDH90QRNWH1uCg/fzGKnjqBDSg9I0gLVe6bOyfWjBPbQ7gatLxLNBOtr6rDZBjnYZmRg
         uzMYMrSosBXDj4oZkgBe4euoxCRV0cjPwY6yQxr0Do4gjHIMU9d56y04D7qg2PtWnlNW
         awyJwFjVJM+MIYCWyHqtF1R4y6AoAh9YYArGkLPsynxoaLL/YkDwLJEBIURQ6JIMbdE6
         ju4+/ZR4ZQTQcYEGx+PjTclgQYjSpgp0PKsbdkedPqbFIlV2anF3TLqGoeKoawvnWfb2
         N9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605673; x=1769210473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nLNoInJmlgiCyTSp0s0aDwUKBeAC7fdewIAWrT/v+x8=;
        b=py/GV03KgRAekK6I3quaSPYFrcK1162QoevrqX0HoUdA6zEDYObeJu9QL3nnTSgY67
         0OVk7OC0eRT1ZaieWqrUxJuy9UwJePcZtwfk342QkbRXByf+5AWbCowjYm/NUnBdUG7r
         E8AaasaTpBxhD3sRNqg1fyFyD8xbIQRVnMMweJb3u77ISz5oXYOA9PtUeP76wLfDmtSs
         OWzw5Icie/QCGzM0nVAzMYmqfHvXOhM63ptaFFVAeJ1ziQ+Wh4XJdPPNU5w19acrOJUh
         9LQOa29Qdu7L2wi9DB0iV5I2V+ak93p3y21lJLfsvX7h0C74gjTwAsZxp6+Luv+VXaNh
         IOSg==
X-Forwarded-Encrypted: i=1; AJvYcCWdl00ajyLdlDjK1nz9lQtM/124/EuDkUdORoWq33S+aW+QbT7i3UxLOAS91DSBvZA00DPxNU3PPig=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwzGlE40vY0quNx5un4HH+FfxwzY/ZFoYaEIxUb37VLgVBinnX
	S3ckaAHA/o27W9LXKqqbrJIva39cdAO0VEO1nGOJMV1LkQvRumxh8+yv/bn71nfkE1Dl6kNqu/a
	81F9GI/V8/IYfwArYQTRM33xoDTkXvoonStJ8dWIGaF+pOd9WpUfYvPhh74iQ8DY=
X-Gm-Gg: AY/fxX6B62t+Dh0RX5W2E/FPBX6prdJDlQJhDJDL+i4+G9stq1Nqkv163O3bc0HiE8l
	upJZRyiYDb1tUSBvFzwA/Z/y6peHb5Kla38w2aS7F3jnRy2ECPfxJcIkhwxGiIPzlXjnHuYCp60
	g+NMpqWz+cHIH+Mi+9LgFx6YmkLPzkAF9BI34NwIsIlPsivaEHLrrKDxNLwdyUYDZUvBqGejuG7
	pxQmKktxJKpK/ABnIvNnzG/161135Wgu3pxRZ9DTNjLYhUfeQMZ1GeY+Ip9T/vF2ECXr3u38z3c
	2GZQ163M+Gubm8BTe9GwYKXZxC9ki/qpE1jla11PZjC/d3wJ1Q/hYSoBaPdYNlCAhjjawFD2tRf
	LmmypFsXBkXSf7uiuSe+inMYVDL7EkauJDcHbQie37C8nC6IRQUWmX1lzRcEUhCI=
X-Received: by 2002:a05:7022:660b:b0:123:3360:aa99 with SMTP id a92af1059eb24-1244a75ea1cmr4361084c88.47.1768605672815;
        Fri, 16 Jan 2026 15:21:12 -0800 (PST)
X-Received: by 2002:a05:7022:660b:b0:123:3360:aa99 with SMTP id a92af1059eb24-1244a75ea1cmr4361064c88.47.1768605672348;
        Fri, 16 Jan 2026 15:21:12 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:11 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] usb: misc: qcom_eud: add host mode coordination
Date: Fri, 16 Jan 2026 15:21:03 -0800
Message-Id: <20260116232106.2234978-7-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2NxmmUdf7vjIvhYDkf8X9bA1KSHjrN4o
X-Authority-Analysis: v=2.4 cv=J7inLQnS c=1 sm=1 tr=0 ts=696ac7e9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0DRR6HtdnbDkULtDn-kA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 2NxmmUdf7vjIvhYDkf8X9bA1KSHjrN4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfXyHOCjjSnrpYV
 x4anZQ6y+b/Fk9coA/RaZbUxBit8GKiIUfmjmO4/i+34PhvkHQwqw2sMUK6F4VyTw2Yy1QJQCbf
 /QPFctjHl2U0NtB/K1gjVMKHX7Ra1mxktLTykKigDVQqPReRVRvT8YlFCTmpBkzjF4wzUUmx/7Q
 dtsRnq/iAAupzlRq3HP71WcWtys4IjmUdCBx9RNQ0sxBpq1w+Oqq+8t2WKytI9m4YDWw50a8Nhx
 WHGtC4SSoy7jwzMu73YuchmF4CB3+6b7nDsal1DZ5HrKRrj7gxVzXUh9Co5ArmtJ+T8lFsMtlU4
 57ySCWkwb0FNXGVHoO8Gj5hTHC9BxgUIvai9do3TFLeC07MackrkqzgZHyhYaIHa3ohaRbcXJad
 +QIHKcDpyY+MDG7BQpz6c6MYZog0yZxQ8eZ6J3nNUmwGObd3cqIxBPUKSfGMk7XEra9OMgLCGnO
 TD4sSijw9hMQ8EBMa6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

EUD functions by presenting itself as a USB device to the host PC for
debugging, making it incompatible in USB host mode configurations.
Enabling EUD, when in host mode can also cause the USB controller to
misbehave as the EUD hub can only have one upstream facing port.

Handle below two scenarios to prevent these conflicts:
1. Prevent user from enabling EUD via sysfs when the USB port is
   in host mode.
2. Automatically disable EUD when USB port switches to host mode
   and re-enable it when exiting host mode.

This ensures consistent state management without creating conflicts
between the EUD debug hub and the USB controller.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 79 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 0ea6491f963c..3f1cc7ea2a6a 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -49,12 +49,15 @@ struct eud_chip {
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
 
@@ -162,32 +165,66 @@ static ssize_t enable_store(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct eud_chip *chip = dev_get_drvdata(dev);
+	struct eud_path *path;
 	bool enable;
 	int ret;
 
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	mutex_lock(&chip->state_lock);
+
 	/* Skip operation if already in desired state */
-	if (chip->enabled == enable)
+	if (chip->enabled == enable) {
+		mutex_unlock(&chip->state_lock);
 		return count;
+	}
+
+	/*
+	 * Handle double-disable scenario: User is disabling EUD that was already
+	 * disabled due to host mode. Since the hardware is already disabled, we
+	 * only need to clear the host-disabled flag to prevent unwanted re-enabling
+	 * when exiting host mode. This respects the user's explicit disable request.
+	 */
+	if (!enable && chip->eud_disabled_for_host) {
+		chip->eud_disabled_for_host = false;
+		chip->enabled = false;
+		mutex_unlock(&chip->state_lock);
+		return count;
+	}
 
 	if (enable) {
+		/*
+		 * EUD functions by presenting itself as a USB device to the host PC for
+		 * debugging, making it incompatible in USB host mode configuration.
+		 * Prevent enabling EUD in this configuration to avoid hardware conflicts.
+		 */
+		path = chip->paths[chip->port_idx];
+		if (path && path->curr_role == USB_ROLE_HOST) {
+			dev_err(chip->dev, "EUD not usable in host mode configuration\n");
+			mutex_unlock(&chip->state_lock);
+			return -EBUSY;
+		}
+
 		ret = enable_eud(chip);
 		if (ret) {
 			dev_err(chip->dev, "failed to enable eud\n");
+			mutex_unlock(&chip->state_lock);
 			return ret;
 		}
 	} else {
 		ret = disable_eud(chip);
 		if (ret) {
 			dev_err(chip->dev, "failed to disable eud\n");
+			mutex_unlock(&chip->state_lock);
 			return ret;
 		}
 	}
 
 	chip->enabled = enable;
 
+	mutex_unlock(&chip->state_lock);
+
 	return count;
 }
 
@@ -324,18 +361,56 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
 	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	struct eud_chip *chip = path->chip;
 	int ret;
 
+	mutex_lock(&chip->state_lock);
+
+	/*
+	 * EUD must be disabled when USB operates in host mode. EUD functions by
+	 * presenting itself as a USB device to the host PC for debugging, making
+	 * it incompatible in host mode configuration.
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
+				dev_err(chip->dev, "Failed to disable EUD for host mode: %d\n",
+					ret);
+				mutex_unlock(&chip->state_lock);
+				return ret;
+			}
+			chip->eud_disabled_for_host = true;
+		} else if (role != USB_ROLE_HOST && chip->eud_disabled_for_host) {
+			ret = enable_eud(chip);
+			if (ret) {
+				dev_err(chip->dev, "Failed to re-enable EUD after host mode: %d\n",
+					ret);
+				mutex_unlock(&chip->state_lock);
+				return ret;
+			}
+			chip->eud_disabled_for_host = false;
+		}
+	}
+
 	/* Forward the role request to the USB controller */
 	ret = usb_role_switch_set_role(path->controller_sw, role);
 	if (ret) {
 		dev_err(path->chip->dev, "Failed to set role %s for port %u: %d\n",
 			usb_role_string(role), path->num, ret);
+		mutex_unlock(&chip->state_lock);
 		return ret;
 	}
 
 	path->curr_role = role;
 
+	mutex_unlock(&chip->state_lock);
+
 	return 0;
 }
 
@@ -433,6 +508,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
 	if (ret)
 		return ret;
-- 
2.34.1


