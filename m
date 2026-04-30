Return-Path: <linux-usb+bounces-36736-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ03GHUF82nawgEAu9opvQ
	(envelope-from <linux-usb+bounces-36736-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 09:32:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3948A49EA48
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 09:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE9D33009F24
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 07:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727043BA243;
	Thu, 30 Apr 2026 07:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaX2zwS1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663B43B7B99
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 07:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534315; cv=none; b=OuDgnoj4zPd5F+DYrCIAGvxtY9RwQpGMRoAXGH8i+/ZltSucMwfRAFBfqiDvxpnGp5evfesXhmuXTdd/XKVgP3iEd+sBC4vqH3UEUYAKKKics8GqVU/bkICfe+BqGHELbIlHUe3ubpmTysvdSuDQ9M+54I+FnbALgS2Aukh5PsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534315; c=relaxed/simple;
	bh=oVFFj403nFj2ambn/fwdW0hGSzLSkPVCqm1sTuOSmEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IFOMK0daDuCmI3/NPJIbViuZWvqrULkeaq2dLVEK4KKyeozS8WFbjncg1ATDdrIoz51yNu0paHhoS9KJe7NtEpKpKm9Pg8zozmmVDAXbdgqCikOBvm2HZiIt8OJ2/EbIX33xIwEQcijVO4U/xGRT/TTqkdE82x5gdfXK5BZnIug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaX2zwS1; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cb5c9ba82bso98741585a.2
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777534312; x=1778139112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=61JvWmfJN4ab2LxNi8kAqsEOa3Evq22JeKeLEg+4URY=;
        b=TaX2zwS1L5y8ptQGJ6WcRWhnxeXtG7+JSFuO/OdyQWu4aRkRPBOEsWZG5dGHu1PIoR
         z/Rv8GF8xylqCkpfzw0/nnS4ku+cRQMqDSY931bAif+NJEQs/hFF7aaVtKJ6O953t7WR
         dlFT70APzzEPUZw6rFrZl2TItkOdkQIa2K6WN8c6yZmoU340FrwgjoUhdsjDjmB8rw58
         R69ETDGv9Ymi1yaYL3LbEK0N3SB9ruWjKK/JNleS679hoN4zKeAPTEZOURWpzz/QisqZ
         ligpQ2VXJjV0RVmnedt+ICEfcMphRvTUpatKvQ4DNNj8hzr00xKS4efHJxivmWdorOsl
         0yIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534312; x=1778139112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61JvWmfJN4ab2LxNi8kAqsEOa3Evq22JeKeLEg+4URY=;
        b=N3WRIAg4/YFSn/bjg6T88vkBsz6hxgj2ubDaXGSrnQDmXbOiBsKv44ABCeAcWro4+/
         oMGfy4T/xSt7M9ezB4wbhcPE0gg3dwteAExPlrsT6Msl+ptkrwh9YlcfzvH+6wqCJ/3i
         Krpq7+qDO26ROHhoZzYDp3m7E1WxDUSiOM5Pd7h/NI+5JmLWzfolKjGpBDr46/D7SDM2
         fl/trz7hB++bXSf1kTY1fXmhwMJZxKFujvTpMsxzXo5QQxQ7HviH1rpAo0LQDqF2Gsht
         CFqEYWun2cnvNSCRwkp8Rgzjuaie4ptqawLOfbm3Ph1bi2cEyLqVlHdLoN1RVewCM2o6
         Xxjw==
X-Gm-Message-State: AOJu0YzwovDUCG5cWG4+OVTcJuTQppW4z+v1X5d2kmmTUPoxJhLLJ/I5
	e+z7qlrg0LcQG+/xn90BE6hdDfMESgbY9bMDsQaAumSUR4jVrCXmPSX9
X-Gm-Gg: AeBDieu13uZ3aZQaG9HDwZyRnSDZ4s/BxWo0sIrEo3SjqYROHzmdTAUBn3NKwH80hnw
	kMX/rUt6nawSizOV/4KAqvrQNvVh4n99o2BN8+1iIDYuMdA3yF/Vim6V7mFEhdOdK2Hw4gBvB7n
	H+lN7Hq0pCT7vSbdVHu6MgCWF4PXAEqawyd6RQPBL5VVcqKIjNXndwro2dburiC6DxZ5YlvWElq
	OEvG0RvH3P+9Nt37esxUDrm7suTwdfK88FTiFzKF2ZIfAivjhyMYImIf4uJ5NPaEKd1ylwwTeY4
	ZCICQYZNI/+JVfMFKJVsuQdJT4SccaSPnmJrwl9znWQI0XtaazYaZMUdG+7TLux8Qe9CG6nrSHq
	+qrHqefipnZL4F0fQUjSzRMWaFxpByRKWFIuzgIHkzwCvEaRlZEgYckKf70nQ4kBH/7JQquGodv
	tVnYATG40L0OGpia9I
X-Received: by 2002:a05:620a:171e:b0:8cf:d9ce:378b with SMTP id af79cd13be357-8fa864db18dmr282806385a.2.1777534312200;
        Thu, 30 Apr 2026 00:31:52 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f93fc6967dsm384705585a.36.2026.04.30.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:31:51 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] thunderbolt: Fix blank external display after HRR on USB4 v2
Date: Thu, 30 Apr 2026 15:31:42 +0800
Message-ID: <20260430073145.331419-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3948A49EA48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36736-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[]

Hi,

On Dell XPS 14 (Panther Lake) with a WD22TB4 Thunderbolt dock and BenQ
PD2725U external display, the display goes permanently blank on ~50% of
boots. The only way to recover is a full reboot — re-plugging the
monitor or dock does not help.

The root cause is a race between the USB4 v2 Host Router Reset (HRR)
and the graphics driver initialization:

  1. nhi_probe() performs HRR at ~t=1s, destroying BIOS-established
     DP tunnels.
  2. The Thunderbolt driver re-discovers the dock via hotplug at ~t=4s
     and attempts to re-create the DP tunnel.
  3. DPRX negotiation fails because the graphics driver (xe) is not yet
     ready — the 12-second timeout expires at ~t=18s.
  4. tb_dp_tunnel_active() permanently removes the DP IN adapter from
     available resources on the first failure, so the display never
     recovers.

The fix adds a retry mechanism: on DPRX negotiation failure, the driver
retries up to 3 times with a 5-second delay, giving the graphics driver
time to come up.

Tested with 13 boot cycles on the affected machine:
  - 6 boots hit the HRR + DPRX race: all recovered via retry, display
    came online after 3 retry attempts (~58s).
  - 5 clean boots (no HRR): DP tunnel established immediately.
  - 2 boots with HRR where DPRX succeeded on first try.
  - 0 teardowns: the retry mechanism was never exhausted.

Full dmesg log - https://people.canonical.com/~acelan/bugs/dp-retry-on-hrr/

Thanks,
AceLan Kao

Chia-Lin Kao (AceLan) (1):
  thunderbolt: Retry DP tunnel setup on DPRX negotiation failure

 drivers/thunderbolt/tb.c | 63 +++++++++++++++++++++++++++++++++-------
 1 file changed, 52 insertions(+), 11 deletions(-)

-- 
2.53.0


