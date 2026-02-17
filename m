Return-Path: <linux-usb+bounces-33402-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H5bOyhElGl3BwIAu9opvQ
	(envelope-from <linux-usb+bounces-33402-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 11:34:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B1314AE35
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 11:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D01A2301F9BC
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 10:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC32F32573B;
	Tue, 17 Feb 2026 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzUH+NC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/XWcWCm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A263254B9
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 10:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771324449; cv=none; b=YooDDnANX5Np9PW6tMrBJ83p6g2wLbs+IlPTs+kHl0XXF2Wc8/16UHPs+KYAwBLX1NH0ZE7KiFSNv71T4DtSIwPLhXZpZ/+uVPzu8wZb1ZNXeTWF8KEtfqxM01dQ+V8DwDBjEsF9JsGX8PdO+Rhe8BmTc+oI/OGJVDv9NXhZUL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771324449; c=relaxed/simple;
	bh=zhLAtAGGstKHRWp19MF5j2m7BbmjxvQWv4VXhGVdOYk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y4FfgYMgDorpaBceu05wSarsU6lFSjKuplPCVJPF6r7AIvAHIKKPqVz+CLfvuvmIW/0+I4RQ2sOEZmxGIKXT5MAnioxOsYfqdMGm4Yhh9QUkWdFM39YlNwhYfeWYjT3uOC4oN3YBKz4EoneFtuNRHlBp7YwZbpGz3A3BBix92dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzUH+NC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/XWcWCm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9P4r51544913
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 10:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lJjO8T9wxsb1RnJjhls1z2D2yPk/MPblQGY
	1v2w95r4=; b=lzUH+NC1Zqy7GbgZZNG0wGAOO347y5l+Nlc6JtFfy2b2HBEyiel
	tK1HC6JgLCOOS+eEZfAqTpaySmDVN9qMFjVTzXVUBUqcW+6/kzoXTi+C20hPBaPd
	n427oT4x6yJcu024BbknbAOrq0/OjHwqzwXXODtF+D2lOdyqYDEFfzJJsSejld2k
	a8lPVQXBiHgJYVA9WGmghXZJ/icFAgP/FwRsiaa1VI3B4sd+HFuXQK2MJNKWWC1L
	CFLzpaV/0uFqoqy/CaAZPE9wR05jCtBYMsxzIDgOqMlA7jD+OjdRd3Pz051PpGSt
	18g/6VarphgLWx6nv7IqoPscIGaQJQn163Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajsu75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 10:34:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71156fe09so2291682685a.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 02:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771324446; x=1771929246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJjO8T9wxsb1RnJjhls1z2D2yPk/MPblQGY1v2w95r4=;
        b=h/XWcWCmnm7B7dqLUd/dkxjXPLzhwXOow7z3a6P5b9SOZ/2m9p3ma4ROd+iGbz6NHz
         eKhakhTllRmzl1DkUMWZHt/RGDBOGZP3MOFNIxlxJVIKP78HTNSkzjHH8gmZe8FSUaM5
         rwoko4HTfC9QuYS2Unfdoi7VZ7MZOsDRDdlX4BccNhTwAQlMgU9OMPsUswEo9Y8LwwFV
         sIjWe6IuiAVfWEPflsD30roUKSmkot8aQGtQWoUNBMD0l9YlkgT0fx6gyQ9gfm/dFW+h
         u31pYj5wD0TZgpjUe/PHLrJzJKg+134r2+gCCDsCrzOzFRSDUh47kTgoPmCIVS11PbO8
         AHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324446; x=1771929246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJjO8T9wxsb1RnJjhls1z2D2yPk/MPblQGY1v2w95r4=;
        b=UFp8W05oTxEZLBdBSTMTOyczKNVUqx+0oPV1rnd5+82fljBKmqZ5oaCfpJuNylwJAJ
         JFhKPWn4coHP3JnPw0Id6IMoEPJuvjak+fPOq6+hP8jga1kThY3VxuhQtvqtqo7qwBg2
         Z7wnxOtnumqpyVurf0evlqI01qMcLztHYRdEsaiEulZ9+bEcNRAskBtY30wp7WmMKzR9
         86nqpuSz4cFBEVAzyJ3TUdnG9nc/MFKUPzSCXEnchgmYo+jlNHVkF8qqk0ZUtujguIc6
         qdr9siQHUhEOrVlDNxaupkAT5r0xqWXuk3JRAT3IurGqX507MbVvh04GRKfbnLo/SLnX
         Xktw==
X-Gm-Message-State: AOJu0Yw8Z+zkPx3YxgCQgsEtsFsn8nHRg5TlSEuVzUwDP1tCg96BA2p6
	+M+BQQvxc1Ps/74329okRo3IWuKbnqvHXhYSnrStFfAIl3934A+TLtzqeybofcV2gK7c3HNXwAl
	VdT3HGsA8XBeJdfD1x+w1yVVzvCvB1LfKCizdjVh7o5LsoYBEJuTnHBycQ8t1RYNVva0Uz1TcOg
	==
X-Gm-Gg: AZuq6aK0UkVePm5JczPpxscCw/FBPpeKhMySlk3pk0kul6usK1VBNkFADt/D6v1R/qT
	JjCflRsv9OPP7LV+SQyiL86xbDthmB/vu9RGV1ewZC70a1klg3xcLLNDe2ejQMkPxuSC50nKvBo
	7TNeJJQ9dKs3Ek0GyzVh5+A7KOabysZ74Skm1oJL6/SlZca8Q4WziP2oEUHbmkBoX7/MVUuzxBl
	joRGIm4HXDJ4U7cY18s4E9YClhfyNJikIPzItddZDPa/oKdgsW9HhPnswSZRqZ+5htSDONZ3IoY
	6ohcUswljbIuHQYnemk9LM2TZcoAnf36dY3Oqc9Mwm7A45n3QH0yyONW/VoXVRWETBBZy3sXnZp
	Yek1apuHC6DPFNSXdWqDbXjCq0ycbIwnKR14IcDjl/1DX5ij+Fx4Wr2D4/lahSDizxB4C7W53jK
	IG/hblQmnXuNQF
X-Received: by 2002:a05:620a:29d3:b0:8c9:eb7d:cd94 with SMTP id af79cd13be357-8cb4c03ae19mr1400409785a.88.1771324446431;
        Tue, 17 Feb 2026 02:34:06 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8c9:eb7d:cd94 with SMTP id af79cd13be357-8cb4c03ae19mr1400407085a.88.1771324445964;
        Tue, 17 Feb 2026 02:34:05 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:7155:d80c:d125:8e25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm34460840f8f.32.2026.02.17.02.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:34:05 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, johan@kernel.org,
        venkat.jayaraman@intel.com, pooja.katiyar@intel.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] usb: typec: ucsi: Invoke ucsi_run_command tracepoint
Date: Tue, 17 Feb 2026 11:34:03 +0100
Message-Id: <20260217103403.1956-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA4NyBTYWx0ZWRfXy3Da6aqFoWdr
 f7gRA8Jlwjz2Ef/mQJJS1fnqL8DGRGlj5IlACdvCZBNIwx9DwT/jN7m1F6FX4i52K8k7cm08u6p
 vuY4t4AIT8orm5PDIwcTeMu2ostXJVwge8q0IIQupYgn1TFYTtsVVI15hR1QJRPFqmSPYXLVdc5
 DtVG9cgVT/cCZb/DYyCS6BTOcJgxj2Qn1/ISP2hv//D7tpUlMpWX4Ffl9meBO8+UkKUqm5xKhms
 V5lxSWkkYDlTH4P6dPTa1GmM0bpy2WJ9G+fW6CfbcKv0u3/pyyeZam4jpEJeSJYJk7YLMluN8fE
 DQ1XU7GCZkAM+rXOpSg+3ck/O+ns75ay1qw/J9oSGWrAw//oqnPEU65DLjxuGY8GbbhXopfCef9
 2c1Jq+FrksI2dKLMQ3LO5GQ4FYti64D3Oxag87RBgu6uvsAfNa35on4SNTNP09BS9gwPTjaEVIj
 +sbaaTuqOU3kfzEBM0w==
X-Proofpoint-ORIG-GUID: EGe_3zqzj2CHQ4Mm00sEh7Vdl5scHS9E
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=6994441f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=Tvdu5u-jWjcwP2ZWDAEA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: EGe_3zqzj2CHQ4Mm00sEh7Vdl5scHS9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1011 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33402-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67B1314AE35
X-Rspamd-Action: no action

The ucsi_run_command trace event is exposed in tracefs, but it never
produces any output because the UCSI core never invokes the associated
tracepoint. As a result, enabling the event under events/ucsi/ yields
no traces, preventing users from inspecting UCSI command sequencing.

Wire the tracepoint into the UCSI command path so that commands are
properly reported.

Example:
50.692342: ucsi_run_command: GET_CONNECTOR_STATUS -> OK (err=0)
50.692345: ucsi_connector_change: port0 status: change=4800, ...
51.750298: ucsi_run_command: GET_CABLE_PROPERTY -> FAIL (err=-5)
51.773360: ucsi_run_command: GET_CONNECTOR_STATUS -> OK (err=0)

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index a7b388dc7fa0..965bb7f4e24e 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -234,6 +234,8 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
 	if (cci & UCSI_CCI_ERROR)
 		ret = ucsi_read_error(ucsi, connector_num);
 
+	trace_ucsi_run_command(cmd, ret);
+
 	mutex_unlock(&ucsi->ppm_lock);
 	return ret;
 }
-- 
2.34.1


