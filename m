Return-Path: <linux-usb+bounces-30733-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E2BC7070B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 18:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3FA0234C08B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 17:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF113559C9;
	Wed, 19 Nov 2025 17:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsP7xGl2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FTyrkZp0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C232430C601
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 17:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763572775; cv=none; b=J+ovtXPnovzNz+jTIfisPdlNDdFJK2zRgmxJ6dLgqsMoET8giahZXAM8YHzi8BVVQwdy4z4SVy5BFnEKjFb8TUDunkaDzZVe+k2gSmQhqFBFlk45+Z/fThvobMxj7h5PNMOfYyIMXgbER25Sx8b5jPuFe7+ZB8mnOiMxlKLQCG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763572775; c=relaxed/simple;
	bh=xt0JnG7eaL+BXiskE6UyYQ+9J8ccTDqEFUl7e4yObCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TlFurbnEjneHW95zUwQGI/65F78Ammkk6Mcy/0cEpfb113tOlgDCpzOLoGVn56IfO9QSZqOvOLBWvKU89V/vCBogsv5DHNB2MQWnMg0dDAEkNfgF1lMinmV8Vv3NYOaZlJ1LHXureRHlSfZSCsr6ojQwZZEKkowfV7EB0+KXBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsP7xGl2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTyrkZp0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJFkC8p2437965
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 17:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=y8rNDgsg0qjbaeG5xWAjOWFb3HihIl4x51e
	nHOT+7O4=; b=jsP7xGl2wW1jQDy6M1WE8GpdJNlD8NI/2lLHcXPn67PvoO3A0/h
	47A8klGSnflciO/rvkKGird9F9/JfRQQui/3Lwj+hJDEdytn8jdua0ThrJ13B1WJ
	afxBE03jfn3r+q3OIYSMvGSfaXRVGsL4YBJ3YjUgkWIf+jLTRmDvLeoOAVMoC0hK
	BACmNGOKJRXgzn4HsAl+INeaNqH+UNqUzXgzd82jTULOFHFmQoE9v8qkqedx4i3k
	prbo5bB749h4ooTKHRJ2AmYJNlzpez+V+yM7hKRiL+FeKJL+GmeIc9J7+8RQLe6y
	Kq0yZaUlsTwiDUNdzVhwJv6c24YAUkT2QfA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah7ant6h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 17:19:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297dfae179bso173607885ad.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 09:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763572771; x=1764177571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y8rNDgsg0qjbaeG5xWAjOWFb3HihIl4x51enHOT+7O4=;
        b=FTyrkZp0/Vm8J8uX0maaxSOCxt8+suTDaycQIS6p5lKoEBk/niMg3VmBNtEilRk/61
         gyQu28ZWeExAyjhMooUXVKbVP5yvkM8e/g3AxpsFN3BIiV52ds1jdrxbWkk90EiXWMwR
         ZcLBzl6bjCbf1tELQ9tQvreen+mseh9od/YXJ7CMxdwz1siuAD5Elo+X/rY9RW9OdcmZ
         IaubJo2YmaF8noR2RuP1MJn4NfAoTC49Mp+O0s5MVYqs0QlX156l0FDbBMgjbw+wvGMA
         4lyBvrHSPUmvnc1YE/ETnd/OiTToUc6tGDhhZFsGBxm2W0oy71Sf71S77xeeAQmZ9RsK
         v6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572771; x=1764177571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8rNDgsg0qjbaeG5xWAjOWFb3HihIl4x51enHOT+7O4=;
        b=SlcEkYQmx3XKgG4myuQ8iuQUReEjISeMO4U3mmkIc3iR3tZmbf0++2rLShB2PmoHWe
         Mk9Xxdjxa1XSBfHKizURiXQJsulGhwWBrJiaiYpXL5jErs0bdaZ/cMAeOXLShTUOP9yi
         nn1ix2mslJQ62C7hLNhDZ5ua8sF076TgZ5meBQUE/N6xwVpJK6x2HLPvyLWIPCqBJMwO
         rK0UWb/RPAtStWR+LDXPNUgv/ZsYA0G3LpKaeRZ7/9CjGkpSIUh9mHT86CVaT8J452zd
         tEUuXczHlcFgPB2f8pywd5W3j8OllIIqkhD5ZVe1OiZozKkZqVp+QSKV9fKg9hJpQvyG
         kM1w==
X-Gm-Message-State: AOJu0YwKmyv/rToFrOOrz0OJzlsnkn4+iGJ2dODaz1FgUXLW4A6UrGQo
	plFRemH5/O1DW97YZjeu8+m7SFAe8gNdr6+8VUEPYzygoJkx7MIm8RivZ2x5FL/Z+f6O4vU4/oJ
	JJDG8cNxI9/BMYDmmTUSDoDTj2uGYdlcmi43BljOcU9cQVQPgJkVvzbBUrwSZWV8=
X-Gm-Gg: ASbGnctDsXrDwVsiSxszGMgNhCMDn/1zQb47PB56PP9AwRo90Nig8p5Y+/rApdq+oSo
	t/NP7ZAkbQdGCHmL4me60kZR5EXu+BAzYDYEaPiDMlTEVrMOj3MLhTeLs80HUokXVBx3TLqVoeV
	rp71xbAT5vEShaGtNADZqoj1GnFLopN+IdBmiiYeVl+saVMi5CJVHJMFCrPVM5p4dWpYXKRA3kc
	Y89hOhLOca5+I02GXcZf6ZotcqugB/77BSTaUwLZVAX5FIIWwrcDKmydTIJZ/pJATy5hVRolG/2
	lMjzEbGfrB+JGodVDF+GiygbvR9ls5j9GPkpQYUPkiFnsxbIZKxwk5RkPUa+Uwj58fVi6u9K/mW
	CmtY5ixEd/xuAX/QCMMnTXaPvZ/oLslPzJXKu2em04cRDn6wsmcQW9XLsvh1YxcL7vyKTanE=
X-Received: by 2002:a17:903:1a43:b0:298:3545:81e2 with SMTP id d9443c01a7336-29b5b061747mr2262105ad.22.1763572771495;
        Wed, 19 Nov 2025 09:19:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtdBQiTGqGdTXLMm2W1bBROrJsb3/UzhGtNWPLbp9moqxQjGVc68bt28q9cBi4jPYR14gQqw==
X-Received: by 2002:a17:903:1a43:b0:298:3545:81e2 with SMTP id d9443c01a7336-29b5b061747mr2261765ad.22.1763572771021;
        Wed, 19 Nov 2025 09:19:31 -0800 (PST)
Received: from hu-mnagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25deefsm334235ad.56.2025.11.19.09.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 09:19:30 -0800 (PST)
From: Manish Nagar <manish.nagar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: dwc3: Fix race condition between concurrent dwc3_remove_requests() call paths
Date: Wed, 19 Nov 2025 22:49:26 +0530
Message-Id: <20251119171926.1622603-1-manish.nagar@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzNyBTYWx0ZWRfXxjv9949oj9H6
 QDVqRkXB4nRcHt5Tso9VQ1QhGI8sexCG7ReHnRA+l2Q2c54DSMqKfTw9uk4aq5G12vx5g2dOwQD
 AiGMDdq93oLGADKjAUhbzxdrnJN16yeb2lwKVC/crMPAvoY2R8jHzjaol1f7B1GPlcHQmNVpDck
 DV7UGJtBXCTGkj+8ZMCTz2NYoltErb4eZDQjjYrd1Jb8++vlhMHWw37BPm9SoKTLqxnivoE+yL3
 vYpvMdFZTnIItk/YXBMDMy+93P5PSXJVnKlBEPOXv9liXlvS9jLPSapVeIn2x6jmYeSsw9CazRn
 s3j9pN9RwNFJBDPhGxdDEWN5D0v5VwLlcRTMOiRd1eWXgnr9wlCzhgQMyi8dpAEb0CnTGu14cyL
 wynCMDCLWy5LvljD0OAoK58Kvt0pGQ==
X-Proofpoint-GUID: zRIfW9x9G8drpqy12XqeJtdNzOu81Dab
X-Authority-Analysis: v=2.4 cv=a7k9NESF c=1 sm=1 tr=0 ts=691dfc24 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=AwTnkmAtCOg3iBu9MrAA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: zRIfW9x9G8drpqy12XqeJtdNzOu81Dab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190137

Addresses race condition caused by unsynchronized
execution of multiple call paths invoking `dwc3_remove_requests()`,
leading to premature freeing of USB requests and subsequent crashes.

Three distinct execution paths interact with `dwc3_remove_requests()`:
Path 1:
Triggered via `dwc3_gadget_reset_interrupt()` during USB reset
handling. The call stack includes:
- `dwc3_ep0_reset_state()`
- `dwc3_ep0_stall_and_restart()`
- `dwc3_ep0_out_start()`
- `dwc3_remove_requests()`
- `dwc3_gadget_del_and_unmap_request()`

Path 2:
Also initiated from `dwc3_gadget_reset_interrupt()`, but through
`dwc3_stop_active_transfers()`. The call stack includes:
- `dwc3_stop_active_transfers()`
- `dwc3_remove_requests()`
- `dwc3_gadget_del_and_unmap_request()`

Path 3:
Occurs independently during `adb root` execution, which triggers
USB function unbind and bind operations. The sequence includes:
- `gserial_disconnect()`
- `usb_ep_disable()`
- `dwc3_gadget_ep_disable()`
- `dwc3_remove_requests()` with `-ESHUTDOWN` status

Path 3 operates asynchronously and lacks synchronization with Paths
1 and 2. When Path 3 completes, it disables endpoints and frees 'out'
requests. If Paths 1 or 2 are still processing these requests,
accessing freed memory leads to a crash due to use-after-free conditions.

Add check for request completion for eps,  and skip processing giveback
for eps if already completed and add the request status for ep0 while
queue via_dwc3_gadget_ep0_queue.

Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Manish Nagar <manish.nagar@oss.qualcomm.com>
---
v2:
 - Add a check for request completion, in v1 I am avoiding this
    by wait for completion for ep0 then process the other eps.

 drivers/usb/dwc3/ep0.c    | 1 +
 drivers/usb/dwc3/gadget.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index b4229aa13f37..e0bad5708664 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -94,6 +94,7 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
 	req->request.actual	= 0;
 	req->request.status	= -EINPROGRESS;
 	req->epnum		= dep->number;
+	req->status		= DWC3_REQUEST_STATUS_QUEUED;
 
 	list_add_tail(&req->list, &dep->pending_list);
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 6f18b4840a25..5e4997f974dd 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -228,6 +228,13 @@ void dwc3_gadget_giveback(struct dwc3_ep *dep, struct dwc3_request *req,
 {
 	struct dwc3			*dwc = dep->dwc;
 
+	/*
+	 * The request might have been processed and completed while the
+	 * spinlock was released. Skip processing if already completed.
+	 */
+	if (req->status == DWC3_REQUEST_STATUS_COMPLETED)
+		return;
+
 	dwc3_gadget_del_and_unmap_request(dep, req, status);
 	req->status = DWC3_REQUEST_STATUS_COMPLETED;
 
-- 
2.25.1


