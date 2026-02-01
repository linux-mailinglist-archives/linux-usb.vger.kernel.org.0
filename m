Return-Path: <linux-usb+bounces-32978-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MVNHECUf2lotwIAu9opvQ
	(envelope-from <linux-usb+bounces-32978-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 18:58:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DC3C6DB5
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 18:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66F1A300F9FF
	for <lists+linux-usb@lfdr.de>; Sun,  1 Feb 2026 17:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF2E283C9E;
	Sun,  1 Feb 2026 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGLDbGmY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D38E249EB
	for <linux-usb@vger.kernel.org>; Sun,  1 Feb 2026 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769968640; cv=pass; b=pB8pfG5kOq41IDq7eKAIGhmLB0+sx8FzBdx+Mpl+0snk5BcV0/XxBiUFzOPa0tsNvCxqOmJwF1+C6uREF25M10jXpm6qdUQxRZ5bfpLf+s/fc4NsSvXkkrrynGtBDTBaKBUu7rBIbxGBbI7LuhICwe7sEPedsn4MugKNROI3SXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769968640; c=relaxed/simple;
	bh=fa25L8AlmjGKyNwk5g2KbIzpLlnikpLyXTb7yO9Rhf0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YZm27VRMvSyBtrzVCiJV8DaXSKdLmYfiD+pA8WzhzimRP1lTZo8LD5O5A+iibOqIuWN76HrYKt7SelYw7OCyLNX9WeGDVmRc7K0tV8BrKtshWUXALRXOcwxaXNcIkQGORcHX4MntNJ35qzg4zlnnoVtlgMti7EdvGM4/mls9vAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGLDbGmY; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1233c155a42so6160963c88.1
        for <linux-usb@vger.kernel.org>; Sun, 01 Feb 2026 09:57:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769968637; cv=none;
        d=google.com; s=arc-20240605;
        b=aF42NvcSwu0xYZ58G/pM0Wd9Chrp0CgeLQ0MMA4tUOQo2JduyM9P/ux2t1b/X9jQV/
         wNU6vsOkIExcaA2aka+HyQo4jt4uFRASfYDAo5htq3E1RyuaIB/4btjzU6XRuW2B2r1z
         J9GgwQnXXgAjiJ7iVtlGfhk31AQUVvJsUFEFk3fgl0z24tlpDUB7SdNRVKVOTIGU/d3K
         0fyQdviM4wMirb8CEMvmGHjpXiWRU5BYoj1Kj3ypDEPIybrq+UDe+dWpNGc3DF3Mc/6E
         qfGtjS46E3n/1PYELUgPLnttvpZJt+Adw5P3Kd4lnC0EwVzP/YnSPnVHWY9ZnPrGfvkl
         m6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=I0lQ6Sra28jclA5GRK++dfxuP4PJKDcI77hQng+Sses=;
        fh=4Q325YsRmMNz8GyUO5x9hPT4pgjw4priqcYBNasgW6w=;
        b=buvM52+QNwZgUaJSGg+6yYKutBf1h9lIM4viOaKsldKObhaF98aKow+//7Hw4k6ZyO
         fRTRwKRHJsspS2sg+vTmxJDK5+g8o/9MuFsvobf9CfaLdu6N/sTO5kAVaSN+BiQR5PNi
         aITyOqEdXixYDBMoXwJjVzmReFk2bzErJ2MXEtNoLDg3o9UHnxUpsu8biHqlSqn2JYuX
         OR10fOlcVbOoYhLNOghENuHjMo9Xhppq+IzuMKhZ6rmW9uLPxMykj/HbHP+mUBoDrEyB
         Se4hUX//a1YwWsfkq9zD3ifvt0OkvrmTDZnvueM0tpXGvVtS/wxQOPIq1lqjRbUWdyiC
         ne1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769968637; x=1770573437; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I0lQ6Sra28jclA5GRK++dfxuP4PJKDcI77hQng+Sses=;
        b=CGLDbGmYwsrv1f/uGkxMj1Ttskau0kZIZzkfBfyDbiWBbGBlwMjenkmra0onhZ0ol9
         LGZ7vdJ9DI3FBx3ZQTUFvo3CR3ekAXyvLJ4t0WMcEhfBl8CaTkBab83g9cdeL0jihcc2
         s7g0H6vVYs7AzSBCkU+YE8T98PYfEwc5/mhUdPHUC1KIbGZZCmgOvX52ekhorvYoZpzp
         Wy6zz5cdJbyjcSg6TZyhwr4t/GJjEAJGh8X6Xk06B6mN7xTqSQhaMlPjgCqU+3BUCfRv
         AQz5YHqta3g6T9UeEiA31SxwttslaJ8YyVh4DT8YrquaVMqyGpSr17uMZYmRrREeWT4S
         Pz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769968637; x=1770573437;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0lQ6Sra28jclA5GRK++dfxuP4PJKDcI77hQng+Sses=;
        b=khI33lN+1d/rhU+gp24E2fCbW1j6YsTFuURGoRnVlI/BOw5da/b5dkMdB7Ve18hc97
         C2OsjovpjJE1tVyIVh3Xm9ICbTw+UCw3/sa8IMYAs8gUv4jiHNAVqgYKQwRG9tbTyBrc
         2eA2RSD6HYiyWismq9DOOokiJbud0sqGcYlQ6YNzxLZYWEPn1C8nDcB2hCAZ/DFd7I23
         VriePBzEuhGKyv2TgpOsYSzAoS5nDzL8MqLH2B+Qo85AOJuk4hXWZ9P4I3cYMvsI2R0F
         7JCYTfoQbYcydGWuLYcTMCYbBbce406ApCobna0Udl2RypIhea921JtqgK4gluQW+daz
         i3HA==
X-Gm-Message-State: AOJu0Yzd4PHZZVwIUGrFbhheLiuB3K4pzYwNvH5/Kljrw4aTaLePdefQ
	w3/PcJvP7uv81AkKGM9DNz2GmSjp6Dw6EVske7N912AXjWAmTpbV4jqzQraVf+thkVxBKM/5Yaa
	rzSDrcweK6jR7KjqmsKQaU4aqnFl9tSw=
X-Gm-Gg: AZuq6aJ3R2r36t4jKE8wVNMNy/PySEYZWFg1+oQGK9f4tTaKEeCoihTAHnVM29wUOEN
	ZHZUoZbKCIYzdfnf60YrV7bbIpnYQsQo9owgVSn8cbvZgxqB/QcFfDIatEzrxx86XqVxEN2Q60g
	HUq81MAVly6uhm1sz7u570JPjBz169Q0MEF8MIHpPux40U/bm/1jJxo+sDSROQxuGgTf+PemD0h
	s1WYt+s6Bu0jrcG2+G6XS2I36BiaZJmYY39MZCuWcWK2HejgE9YRafbqOk1QGJdICrZLh3sKQVk
	LS/k/qIwkmuMpbLPDGUqAlCUz0f3
X-Received: by 2002:a05:7022:660b:b0:119:e56b:9899 with SMTP id
 a92af1059eb24-125c0f0fa92mr4125675c88.0.1769968637147; Sun, 01 Feb 2026
 09:57:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Liam Mitchell <mitchell.liam@gmail.com>
Date: Sun, 1 Feb 2026 18:57:06 +0100
X-Gm-Features: AZwV_Qi_TlsT3yJLwTp9P97_Mloszcjkr-mJoGdoaDLKcd8u1m7BdRJvGEjI-JI
Message-ID: <CAOQ1CL6Q+4GNy=kgisLzs0UBXFT3b02PG8t-0rPuW-Wf6NhQ6g@mail.gmail.com>
Subject: usbhid: Intermittent EPROTO errors trigger USB reset and interrupt
 user input
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32978-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitchellliam@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5DC3C6DB5
X-Rspamd-Action: no action

Hi,

I'm trying to understand and fix intermittent keyboard/trackpad issues
on my 2013 MacBook Pro running Linux v6.18.4:
- missed/repeated/sticky keys while typing (this thread)
- trackpad stops working (see "bcm5974 trackpad broken after USB
reset" in linux-input)

The keyboard (usbhid) and trackpad (bcm5974) are interfaces of a
single full-speed device behind a high-speed hub:

/:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/8p, 480M
        ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
        |__ Port 008: Dev 003, If 0, Class=Hub, Driver=hub/2p, 480M
            ID 0424:2512 Microchip Technology, Inc. (formerly SMSC) USB 2.0 Hub
            |__ Port 002: Dev 005, If 0, Class=Human Interface Device,
Driver=usbhid, 12M
                ID 05ac:0259 Apple, Inc. Internal Keyboard/Trackpad
            |__ Port 002: Dev 005, If 1, Class=Human Interface Device,
Driver=usbhid, 12M
                ID 05ac:0259 Apple, Inc. Internal Keyboard/Trackpad
            |__ Port 002: Dev 005, If 2, Class=Human Interface Device,
Driver=bcm5974, 12M
                ID 05ac:0259 Apple, Inc. Internal Keyboard/Trackpad

Logs preceding one of these events:

[19607.563871] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
[19611.523681] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
[19614.550685] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
[19614.563878] usbhid: usbhid 3-1.8.2:1.0: retrying intr urb
[19615.050802] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
[19615.067673] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
[19616.822636] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
[19616.835934] usbhid: usbhid 3-1.8.2:1.0: retrying intr urb
[19618.126656] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
[19618.126711] usbhid: usbhid 3-1.8.2:1.0: resetting device
[19618.126728] usbcore: bcm5974 3-1.8.2:1.2: forced unbind
[19618.129942] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb shutting down: -2
[19618.155292] usbcore: usb 3-1.8-port2: not reset yet, waiting 10ms
[19618.217146] usb 3-1.8.2: reset full-speed USB device number 5 using ehci-pci

Both interfaces receive frequent EPROTO errors. I collected statistics
on the error interval over a 30 min idle period:
Interface, Count, Mean (s), Std Dev (s), Median (s), Min (s), Max (s)
Trackpad (bcm5974), 631, 3.21, 4.75, 1.74, 0.01, 35.62
Keyboard (usbhid), 71, 26.82, 24.90, 19.34, 0.92, 107.74

From debugging I understand these to be missed micro-frame (MMF)
timing errors in the host controller. They require URB reset but not a
reset of the whole device.

The bcm5974 driver simply re-submits the interrupt URB. This is the
best behavior for these errors on my machine.

The more "correct" usbhid driver will delay URB re-submission and even
reset the device if a second error is received within a 1.5 second
timeout. It's these periods between EPROTO error and re-submission of
URB where keyboard events are missed (missed keyup == key stays down
and repeats). The default error retry delay of 13ms is relatively
small but a full device reset takes about 200ms. With the frequency of
errors I'm seeing, every ms counts.

Can we improve the usbhid error handling for these cases?
1. Reduce first retry delay from 13ms to 1ms?
2. Reduce the stop retry (reset) timeout from 1.5s to 500ms? 100ms?
3. Require 3 or more errors in the timeout before resetting?
4. Ignore EPROTO errors for known hardware/quirks?

Are there ways to differentiate these safe-to-retry MMF/EPROTO errors
from others that may really need a full device reset?

Appreciate your thoughts.
Thanks,
Liam

