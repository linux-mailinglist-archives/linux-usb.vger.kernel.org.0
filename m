Return-Path: <linux-usb+bounces-30164-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE360C3C0A0
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 16:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C6E9C4E35B2
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 15:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6E2299952;
	Thu,  6 Nov 2025 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EA68087N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E36295DAC
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762442854; cv=none; b=XbqLpPoLjhvY8RIAQ+BsVgywlG8MQ/G1/QuSKOTTuUdex2zF7DeAgKqbw9adckr6ejzuhF7uFmp4Xf5oTjsLr5Vv7d+FHTkahHQVCDZY6j3JEdFqmgFcqilcSyQAljQRsZ2rGImLKVnMlHBa3UFp7VHY9ZxsZrwC32kbyN+LlCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762442854; c=relaxed/simple;
	bh=uOY29gfQ9pYvhsdHgOJqKN4kwupJHd/9xjGIv3Qc89I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJsW8Gt+beT3pqCHv228VZdn8BK8ri09Y6cLBdtQaz4U4DComig0IQ9kF1VzJ/KNi3WVF7toygojfOv3Wt0g21gxTFUT5Ev+Rn3TNDP947BuH3MuGM7syA469W2hFk5Pnq/+gDdRw0ko4PlFEJQxaGJjzpyrFYeYJVTKspEG3uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EA68087N; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47117f92e32so9145955e9.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 07:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762442850; x=1763047650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OQVBmc/h6wETq5SdNeJOCY5mDPOnuTaKFlnCCqogTDE=;
        b=EA68087NrMPv15v5nYyQaVpb8poiLgFUHhrtVxE5zvyBh+PhgMMcZjBp8cGkAL30Mb
         FgqeuHqsonwT0cgCo2CQYAvKFuuvY5aONXaQ7EmM8suKmQa/v+yL3UZvUuLZ+sANHYny
         /HulVEbX1lCJp6EQbrHinDEa/1mFWwev3+C3GglfGHfJyISgFv4iDz/5V+yzJ7qSN3YR
         x8kyzeSXroMbQapi6ckOT0JivlEmfLyRQgk0vgQo0iSGId2nlovEJfBlesBYryyHebDv
         j9DCNtzNLS3Ac4mVAYqmnXgdj9tTU2JGyvYvX5TRzd5pQk0qnhow2r1qBgGQnddx9gVO
         5jIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762442850; x=1763047650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQVBmc/h6wETq5SdNeJOCY5mDPOnuTaKFlnCCqogTDE=;
        b=ubl7JZrXR06cTiw9Q4mxaScVxIQu3+ZDbI4lD6lXj+FaqH/VzWzpf9HNXmMif3FYky
         df4xkj+srKdSLF34mwJB+k3RzXw4mITpEvG5wyqplhmE+eICPxzmZCG3JE8E5CuB35gu
         eUl/GAelnK1rJcR4ajwCiT/+LeRAb6OET70yRq97eQe+w/Gmt5feIXLqldLyr0DuwC61
         dqEwfkIJBUemz00MFiOiDwUG58g5kAzb1NuEEL6lb+r0e2B7yiK++dsE2rxmZtMDKXwo
         PblJzfax3YUcMakI9/PaQawRVOuhrnjkqD4Tdo9olw8W3rgRiQTKypEEhn25E4CeRCc0
         0vtw==
X-Forwarded-Encrypted: i=1; AJvYcCULHt4pIYJ0nAFZh2nqd/EUkCj34N9gb5zqdNXfarVyyJIn6fah73hpuVBJrgU5jL5QRpYD4AVeW0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaaSmsCYfGE6eS5ByWfDbFmMQivBa2r/PugZNBzToux/2hhZe7
	Wok7+T+dB92oL0q19kO0EN4pn+wIUD0xZAXWoYbo8UBgDc9V755Vg3Qz93c4vYnjqaGjPi6QQhv
	IiFss
X-Gm-Gg: ASbGncvtimPY65W702Kc92a+61qQ+Mn7u+nIRckPZ889cK6U8YukBpRPbUladUyPn4o
	Nw/CMLkvtRTzgrZCcdiICidByxsJIg042+kKiEiDKZE+zDmA6t+X9OiICYekFNXsVwrRxXX0HRU
	e0x29EofRN+K3921/KVKEgVOF90yXSMa9qkbIWIyF0pbI+LXMZRrxURs22lH/tY/pgP/h48KpZL
	igBrdpiaB0gXFRMugWZq8fzurW5ALU6m3Um6v/d8+6mtF1ZzHLjKCzh//TyZYB5H7B+y/UoGJ7V
	LQ5ZtG2ZRMg1Tpweka9jIl4pklnN+YWXzMx+Qt+g9WjzV74krn+CnfHL5A4FUWP2rS55Lep9IT7
	riW0Yx4pk3jjM/2XMMKLnN2rHRRnXuHJmd9057CZt2CqbNSrSQvORHzDuTKLfFuwMy0uLAk7oie
	0x8gLljnPHFxOMMgOn2hpIcYw=
X-Google-Smtp-Source: AGHT+IGOOl9Y37iFUVKIyQvTyVMO2oHC1gnlssxt4NpSnOygjrgvibLrD6QaP23vvHm6Chd4zm+I7A==
X-Received: by 2002:a05:600c:468d:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-4775ce15bbamr92196725e9.32.1762442850469;
        Thu, 06 Nov 2025 07:27:30 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb403849sm6020368f8f.1.2025.11.06.07.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:27:30 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: dwc3: replace use of system_wq with system_percpu_wq
Date: Thu,  6 Nov 2025 16:27:12 +0100
Message-ID: <20251106152712.279042-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

Switch to using system_percpu_wq because system_wq is going away as part of
a workqueue restructuring.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 6f18b4840a25..81307a7b383b 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3872,7 +3872,7 @@ static void dwc3_gadget_endpoint_stream_event(struct dwc3_ep *dep,
 	case DEPEVT_STREAM_NOSTREAM:
 		dep->flags &= ~DWC3_EP_STREAM_PRIMED;
 		if (dep->flags & DWC3_EP_FORCE_RESTART_STREAM)
-			queue_delayed_work(system_wq, &dep->nostream_work,
+			queue_delayed_work(system_percpu_wq, &dep->nostream_work,
 					   msecs_to_jiffies(100));
 		break;
 	}
-- 
2.51.1


