Return-Path: <linux-usb+bounces-35634-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wyDQNTGfyWlY0AUAu9opvQ
	(envelope-from <linux-usb+bounces-35634-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 23:52:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705E35436D
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 23:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF94A300DF73
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 21:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDADC249EB;
	Sun, 29 Mar 2026 21:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMqBfOwB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7CF277C9E
	for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774821162; cv=pass; b=OtT3OHw3FXguOb6bLdSaBpyU9nTRcrsAdmwqwLnHRPYjlysDh+3FBgX+2iZMclxF0PgwM1sU9kFU7YvHNYgPMasCFLmcYIwkJNogfyIzd59uxW0kBR9Hcj4XQo0hqdsa+1onQmypZv1H4t6mmykGUxA2+SU7/Zue+Z5CPdJAa2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774821162; c=relaxed/simple;
	bh=+KHsXpk4Bj5T7aVjbf43mg6Lj670OSR9DtABZud9Tm4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=qdA8YUxoOqI3xhcX1keIFcyGFuD//3RIwtEH8xCogWIwaHEV+xUz9lgW8u8FuoY71biPrGYQ+MHsp1EW4viUauNMRHRxzXULRNer/3QVO9ffNWxv5onhw9VHrduPsNDmhPcI334b0wGm/0ixhQYu4aVk9WdrUPYXAAkAHDn6kM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMqBfOwB; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-506a6cf8242so35569701cf.1
        for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 14:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774821160; cv=none;
        d=google.com; s=arc-20240605;
        b=Q+oEYOxb6LDu8wjMg9FPOt7jNPvTzyZUpiQV4I3XPsXaRoEcvjEBy7UrwEWfVXEdGv
         rrbjM1bWTjC8qUr42xp3K5iSRbOQSCqxqNrEQM89kzWVM8fg3NhBznvWLHOFshFd/2Hx
         rZbCwpo+1klWKedAFgiks3AWv2QB7l8Wuv3WoIkriIxhCtKjQ1eaR+gX8cotk/H/y7Dz
         w7cJR02hWiiEJfcEvzXVxkqUZnTxFU5oQovdNc98OnXG9SqSnc6ybIaEMp6KBKRDKhpq
         s0Jp85115TM8Cetsj8CMlYUHB6qJfHu7mf5UnJLzGqgccC1sAi1Co+iUBEo1X9C8vWAU
         WVTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=O0hJFH0gnPP3YtgQvJeqQgFdbeo4pCYT0Suo4Gx/Q/8=;
        fh=VimqKRrJCN9rdcfuq5onff2+63396vNbthBTDDSyxg0=;
        b=MqDrP3+aGnrc4aEuEOy+m8k5m81KlS/QzArccnpKD6sVUtPDSsJUrRR/HggFAFreKu
         ZqrV9lceLDiDIg8HD4zKi/87IxKrk/Kij6VRhC2H2tC/MXQetSVKG/yDXjFeiwkGSUb5
         5ACjFurjvkIbyBl7gHQGYvphXjQjVI+OPtnTlIny1OspXid3O5XpfpoMDqqsjTzqxA2O
         rBuZDqWBJsVAZMB7dbJVl8VgZr2NaGsJlvWEgjb/rDDAVyHxyG9IW8El1JhGuh7XwGx4
         Koypow1kl5bJDddtig0OCGyTCOo3wzRxMQxYDOBALzpw9BiEeeZECfecuMfSptc0r08z
         Dk5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774821160; x=1775425960; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O0hJFH0gnPP3YtgQvJeqQgFdbeo4pCYT0Suo4Gx/Q/8=;
        b=hMqBfOwB9WjjS0S0SxdPc9wDp/znslpw8ZJzuP/5aVv+3HRjlfqFA3ilcOQ+pnVoGb
         frrUJQDHM2cQkUwRrKTN0/mFArDWeyqS5kcAUNAkPPTfjej4SIY6L6jaC3zBMu4lD0gD
         mJaePOoDni/toaBARnzRHpbo+zDj9ZyArVTKiGIS74CXoaa84mXj4QuhhQUE5rywTglo
         VNy1KGFjyYOrcdWYD2cM6Gn6ko2MW0sWpskAti55FC9w/4Yk6763conVCcnfnjSkxF9A
         82kpf7XCm4XI/A9fm+FuwQlJiw93sHM3vLPK1Ez1nkjAaDuLN53eTotXzOy+9A/UxOkn
         3pvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774821160; x=1775425960;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0hJFH0gnPP3YtgQvJeqQgFdbeo4pCYT0Suo4Gx/Q/8=;
        b=LUJmjlHmJm3EOs+JsHDxgKx07Db3vOGndR1J4Y3cMuRArbWxAAjKm36dsvpQLEd9xw
         KjQ0lBCOMC7PLKBYjeDYbiKmArDQ4W8lG/7JdvvvnCVPgKjOQJKI10ZZKGSMKa0Ie8ZX
         pBAKhtPNvLwc3pQSgezQ12u1oYwe/HeojSHKv4SHf2pvBFL61qXGJ0wkJ32SvvAaZ7RS
         qLX3xJHVnk33mDToJ5x+DVakLL21WgY3t6d/jyVvk53xAtWcPj7KM79mcm17hzqJWnZx
         18ZZPbXH5QXJ+8XBY8wgpEunN7NIUwBn0usHjuHntV5lLjFXd+uQXqA00Qk2wjR3l78Z
         GIhw==
X-Gm-Message-State: AOJu0Yw2SvwoObKT7J/X9JnKhClJIOA4Lun9/MAYt640yK3wFh1aJQIV
	ymLzracNRNtL4+laE5eIFAn2l6KUIvjyX2BCeITPcwWIlLoz43vRqV/zJzEZsRqEL4GrW++fian
	HNTq5tC92C+s0ztRniDoAgsva9RNzX3aQMs8c
X-Gm-Gg: ATEYQzxat/UknoJ2LA4mwP4WJoS5i05PpYG/khY+igZLa87EEXlY7YYFie64m6lXOo6
	E4MrZGMa11O/F4QfKold/IbmQj7/Zix2SAukCyw6lGOW7J0qNLYxdp/1OLyTLtsyU/63AuMsYED
	q6VILRmI/ZAbO1OgWoNWBiVgy5PHM+Wi7AFXuBaPzZUcgxDu1O20KgQApUClHXo5218zgtE5+h2
	OvMHH+4W7BMQ3FZki/j9GH5Ij5Fa2VoyPWoZvzD0SX4Z11xeFNha8crLAnOKXZgrYUe1fpRkcSt
	JyUXa3kWMdyqKW+co7xQpLh+5mtZSP9wkbI08A==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:ac8:5754:0:b0:509:4d26:25df with SMTP id
 d75a77b69052e-50ba39c1849mr134980741cf.66.1774821159799; Sun, 29 Mar 2026
 14:52:39 -0700 (PDT)
Received: from 753967548648 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 29 Mar 2026 17:52:39 -0400
Received: from 753967548648 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 29 Mar 2026 14:50:58 -0700
From: martinalderson@gmail.com
Date: Sun, 29 Mar 2026 17:52:39 -0400
X-Gm-Features: AQROBzAltabklyBs3ue9Zokc6gKzSOIu9slKZy7CmqvIqY_ffkXsCQBAr8BTaIQ
Message-ID: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
Subject: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] dies on
 resume from suspend
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35634-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martinalderson@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3705E35436D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[BUG] xhci_hcd 0000:0f:00.0: controller declared dead on resume from suspend

Hardware:
  CPU: AMD Ryzen 9 7900 12-Core Processor
  Board: ASUS PRIME B650-PLUS
  Controller: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
  Subsystem: ASUSTeK Computer Inc. [1043:8877]
  PCI: 0000:0f:00.0 (IOMMU group 30)

Software:
  Kernel: 7.0.0-rc5 (commit be762d8b, built 2026-03-28)
  Distro: Fedora 43 (Workstation)
  Desktop: GNOME on Wayland

Description:
  On the first suspend/resume cycle after boot, the xHCI controller at
  0000:0f:00.0 (AMD Raphael/Granite Ridge USB 2.0) fails to resume and
  is declared dead. A Logitech Unifying Receiver (046d:c52b) on this
  controller is disconnected and the mouse (Logitech M720 Triathlon)
  stops functioning.

  A second xHCI controller on the same system (0000:0c:00.0, AMD 600
  Series Chipset USB 3.2 [1022:43f7]) also errors on resume (USBSTS
  0x401) but successfully recovers via reinit. The 0f:00.0 controller
  does not recover.

  Regression from rc4: suspend/resume worked correctly on 7.0-rc4 and
  earlier kernels on the same hardware.

Reproduce:
  1. Boot with USB device attached to a port on the 0000:0f:00.0 controller
  2. Suspend (systemd suspend)
  3. Resume

dmesg on resume:
  xhci_hcd 0000:0f:00.0: xHCI host not responding to stop endpoint command
  xhci_hcd 0000:0f:00.0: xHCI host controller not responding, assume dead
  xhci_hcd 0000:0f:00.0: HC died; cleaning up
  xhci_hcd 0000:0c:00.0: xHC error in resume, USBSTS 0x401, Reinit
  usb usb1: root hub lost power or was reset
  usb usb2: root hub lost power or was reset
  usb 1-7: WARN: invalid context state for evaluate context command.
  usb 1-10: WARN: invalid context state for evaluate context command.
  usb 7-1: USB disconnect, device number 2

Workaround:
  PCI remove + rescan recovers the controller:
    echo 1 > /sys/bus/pci/devices/0000:0f:00.0/remove
    echo 1 > /sys/bus/pci/rescan

  A simple PCI device reset (echo 1 > .../reset) was insufficient -- the
  controller came back but did not re-enumerate the attached device.

Notes:
  - The 0f:00.0 controller is USB 2.0 only (USB3 root hub has no ports)
  - hci version 0x120, hcc params 0x0110ffc5, quirks 0x0000000200000010

