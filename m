Return-Path: <linux-usb+bounces-34361-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JiiM+cur2lzPQIAu9opvQ
	(envelope-from <linux-usb+bounces-34361-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:34:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 852CB240DF5
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F83A30160D3
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 20:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F59536AB58;
	Mon,  9 Mar 2026 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9LnB6cu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QdfMZC70"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337D036C585
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 20:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088429; cv=none; b=UgA7g7M4+RWRfmRzYwbIZ2/xkmrJanK6c8EcZwPk8Bs8QuvrJmhD2HCClnPEBI7vRze15UrKluT57kSv9QVxG0Q7Kxk3ksGb8j3KcRY1EuaAeNDnUegfkgW1+of87bnoaz7T5GMVHCcjjwJ1zjEWpBek28F9fPSwWHTzImfByio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088429; c=relaxed/simple;
	bh=royapcGosrFDfN1+WyvBjef85L3TpzNsrnUe+lEHvP4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W7N56/gO1I8l+51UDKYKzODqHk5wzOoTzSaH2mDjZ1VNlOIGFxA7DFgSWiR3Ej0kCsGRL1lMQW6T2tE0YRr3ctbxbAe2wmACT93Wb4MrNu4oia8tDM9Y1VgQNbIp5JhxJQ+cXzVZQaSgntu/k0YVlkhXgC2X3+qPKaQMk8FB5Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9LnB6cu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QdfMZC70; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HDML81214071
	for <linux-usb@vger.kernel.org>; Mon, 9 Mar 2026 20:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZtqMZiiTPmW
	H7gYvculLjfwmF7B59MpYwDHoaL2++qE=; b=P9LnB6cupDYWUrtdb5ZvZBxvD9r
	VpT4BxSIFQDBplw3dumBaGDw1Va5RZhmHD9jYkuV53srS6x2/1AmwoUg1keywHUK
	vEwltS7mJ0xwmqJZACmwuwhjjCh8WGJ5j/UPXllkQ3VJ3DRAob4OTIPAtWtcFf5Z
	0PQ1Wov1apcpw78xwsiqUAm6N8ytJSEsgbyWLbelmbv5lJE8xe60TkAY1kENX2Bq
	rOoSsXCpfbJPRvq0Vpx1wCWAwOTxwSYiP+KkyPTBnIzAGAjkDpYYxCGIq4I3qgsW
	r/9i+Rk/n/CkMRfnGvjJgzTresPsV6TIhyamt+QIM9TJ3onlnvQHGG01gxw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkhmdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 20:33:46 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d7423ac71cso6957052a34.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 13:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088426; x=1773693226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtqMZiiTPmWH7gYvculLjfwmF7B59MpYwDHoaL2++qE=;
        b=QdfMZC70baH1r/X9Bhm2/TUoZP1ZCT69XqkxCUwFVklhiq/ylNI26kfOCWpNV9Egkj
         bRxUPJRFCWgBIs+Ksh3FXu/gn3sUcAO59K1Y1lVMh4fDnlPYpxCfovjHV9r8SkEfI82C
         XM4o4qkVLDOYs0U9gbdwcLdi/YagP4QfWwseLevB2zY2P4S7vVt+d9Ebn1XDQ7vaqmhy
         +HaDUZibTNejtDFpo5qtwzJeP3lkX8DjitdUY3fiuv50qxNfFqcBdyXSgqivw4nZUW57
         pOFX797xiT2eq2AzzmO1g3Yvqn5wUt8xX4UrbTXfgeECAG+ZOJ3ODDKieX8DC6C5gGXA
         XGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088426; x=1773693226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZtqMZiiTPmWH7gYvculLjfwmF7B59MpYwDHoaL2++qE=;
        b=FM2yF6K9O6UVmmFnjCUS9hhD4CkXEV4GigjDWGvsBMcSdaVJEI5QgYKhR7Vy6N1RzE
         Ntj4xbX9X9AGiSQQdYMfbx4Gre+5dsCz/0CMKu8Oov4a9ZFdSOApmGWTjxS3rX+7E+kv
         Der/9NDRoJZE6Dkn9JAaCSWrQr4/DtZy9PkkdfmwekSnBdkBK3HjnnKuLPk6Con3l/Pr
         zzT9KQ7/K0PDn3xI7BbKsAyj3qP+XnS6yW46YXtYGhiIBYSSMCDELmNF0Oevwlof0eyK
         7bXmWJdMbJuZawcpwHtuJFyhhRBtv3v749ujzoi3rVgvSzd1PmWXBn79d+6xnZKnRPPE
         YIpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb3XrVWFgoQvZuhPNcdoFllHdlG1ViJ7DGRO1RhnhgZdh4wHngKR+g0A7r8uz95vVZIGmlyEdzsgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCpAzmWlmt0q30zbe9sYi7Xy5Wccko6FS8Z44/FQm7MPe5V/37
	UvJuFTniVwkWAfvxDPv9+OfNiMcr69mhbYXUPcsNKqDeHmHu61B3Oi3V3jKSLPBMSlt61LWQsel
	YAvllbYOpcuGUNKCybcOZpiZ39X7sc8oUSuHftUzPzs+RaDNsEzzDc1DJY1lH25k=
X-Gm-Gg: ATEYQzyjCppqazBeDOVyGoEd3Wb77eDwasa357+9tQxu2m+ydr11NtUcdbQBaLggaH8
	rIr3KGp5CkoRL5LGN/Q3B2IQYG/01U2weVaM+itxK/eTlwqPmIGCkuJbk/ISw6gEo9uwmwZE8OL
	inOMfxG068+UJALMFYRjdBpqHBGDO0CYJhUmy06I5WXygRys7EbycOJ6UODpkD/23tnLGPOovPI
	iuoOXoMSa2aM3e2smKzTQM5sIuDZv/JLfRXBW0WKe9raNtWC5PEBycfEmCpMkdxbEvXkbknw+Sv
	R2FWsKbtQkZBjjMMeY2aY4bk/rRYKoHsJ6etyasfyFQnAqXaJcfec5F+q9N8fXLa/mxR5uix6L6
	11+FL7C/e/KI748WQeB8cziOYv/SJshzOEO/0UYXXaL+TEUpbGmQazwEden9uiBErLZ5jYAZgtU
	g=
X-Received: by 2002:a05:6830:a8f:b0:7d7:5016:7ed1 with SMTP id 46e09a7af769-7d7501680a7mr1815247a34.33.1773088425984;
        Mon, 09 Mar 2026 13:33:45 -0700 (PDT)
X-Received: by 2002:a05:6830:a8f:b0:7d7:5016:7ed1 with SMTP id 46e09a7af769-7d7501680a7mr1815235a34.33.1773088425634;
        Mon, 09 Mar 2026 13:33:45 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:45 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 05/10] usb: misc: qcom_eud: improve enable_store API
Date: Mon,  9 Mar 2026 13:33:32 -0700
Message-Id: <20260309203337.803986-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af2eaa cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=iEam2xx7WbKG8qDqzoQA:9 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: wvYSWUPciLIzHQ0Hvl9ohcJAJchYwQ_R
X-Proofpoint-GUID: wvYSWUPciLIzHQ0Hvl9ohcJAJchYwQ_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfXys7gn63Zxw5F
 SCQdz+Lnx+mC4KYpv79vqXC1x7LttHEA+w03r+Ibu9RlzdpIwWDkid+w564HFfTELK/sahAQkZP
 irJjJnkbWodsNydNkYbAEOLRuqqw0Ric/JouahAJ15YFNd3RXjM7ly5E0bR65xgxVuHuBzQc8Jf
 +yp4j8SN8OQmw5ODt0mx32m7+26+FS/s5zkyQ1zP1beDkDEHsVGbBAFxPYc8il8Y9d42q/S+V+V
 9uc3ShT4ja7zuYtqhGhC9Yddr2QO3JFM3paUMJe1hazsd1cQI3hZgdxuwgLS15ZSr5BVlCNj2Zl
 2dl9UizS/Qvglj4ehZlS0kc8TRh6iH+uxVuXE3ibwedbGs5rdXQpDc3FCydBQR3LBRI65oGfMcX
 S8xq0PBQpHTGAvKr1hgCheD2Apn0zwjbf8/IRGfdZ/KsZeFw79GPXcHCHXk1yoH4ECSFuCD04d7
 AJzFQyz40IZ6I8DlcBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: 852CB240DF5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34361-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 1936b45791d2..4fd08962d4fb 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -148,18 +148,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1


