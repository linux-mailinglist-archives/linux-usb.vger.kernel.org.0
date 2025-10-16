Return-Path: <linux-usb+bounces-29373-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 527ABBE308E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 13:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0DFCF4E2205
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 11:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E173161AB;
	Thu, 16 Oct 2025 11:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEdgZgB4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A4A314A99
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760613597; cv=none; b=KXtegBXd2p5ppiwrOEta0zPTmNj1pWAlWpziMRFYZc8a/AgNfPdXjf69URbbnXg99R7RSplT0PW9FFIn/fctHXtj16C5vMzIU6fyllFc6GjkU3nR73lMxHBymUWXl/S4Hb7/rRw3HRQDCKznmVpT4nyfCSfeGn3mkJK2askRIH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760613597; c=relaxed/simple;
	bh=t8irD5vmd1q1N165tVfJmM93NWnlpp3W7teygC5CmUU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=HeaEpd2Ud4+sBrUTSNrcy5bkgGcQl4mDZvWQFTDups4mI/Px2QMc4QVZQhbVU0qOnxsUkaiVUpLVuuOCOVh7e/6QdDda2wzQAnrcY+axsLHtfnKXeuCgu+xONO9cMJAHm9x3ANCbQ0EHF5saqnLmavuvsXsvj1YKiffDP2C8b8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEdgZgB4; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so787315e87.0
        for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 04:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760613593; x=1761218393; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnmgJq5ImXWk3yZG8tFrQBpEf0SGRpRaFDce2txhtwk=;
        b=SEdgZgB4Dn59X5JJRHed1JdnjyVwbXG74dVRZJ2IRv+8g07tLk74rFeCERUQxXO4Wg
         yiBr5jaGyixzkwOgXzuYbKQMv/Lx16rrOJlb5LBHw+ShfO1malPVPaU12wOMEustAhnf
         Nx1Rpa7k54L482pqonVz24cxZrFnRjTNDjm1MpJNyNfFjMdl5DUfTfSi0OGKf/4TI+8R
         6AMK0XLwpnQjnVdMKZzvCmneoVWIb7KiyL9PnJxQKAJs57n6kJEnvSRYBjqYikK+DrHg
         7LqdYjptPSm9fwods/YONqx74C0Wbp9wGvUsnRcgzkEMB8HOIr1UQxidFZKdYYEgHNH2
         8z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760613593; x=1761218393;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fnmgJq5ImXWk3yZG8tFrQBpEf0SGRpRaFDce2txhtwk=;
        b=wXjn/OcXq3m+8zGFRfttbdPQwZDENZX6oipy4uU9lJj58zfwtDSy7BoZT9zSsHNTBR
         +4zBRvP5kyrMmyIe4fDXK+NfXWD6avl4tQ07/n74/ZXXyKIdcOhC2H4qB6rrmFg6IuVt
         y+EFIDeef4Rs0kuDGmsOtvjWxlVx7GbzmsQoZjl2KJadoCU4b2Bhz4S1WUL81j+2K0/g
         4cin2cZl7j5dZIuPiUzuiwJ/hTr0wDrehpCtnNHcoKbcN3vaiTbmh/1tUJSD9EE7NNEm
         J9215Q/aop2Nootawy6EpZOf3O1KjbS4dkLInOsCKd3gxhHwunDgLpDiOfcn48h18ZXL
         /+9w==
X-Gm-Message-State: AOJu0YyImAamuNxFNQ/1T2NlBLTHm/hhmM2HM5XjmA+PEpCdnicT5Wgh
	B3gkS+4E6Bsh6r67X1q7QI2tV/iSKyoXFY5jdpWPemSyePv+ZPdCUiS6XupxFQ==
X-Gm-Gg: ASbGncsjsDbMZE3o8lxNKnROBBWfXLmxLchqN0HqZeV6kvt98GyAqalJVJs6Lq+hpch
	W8JpnrOP31V1M9voQqxiT3KmnwQUZjP3CEwMUPTw5AwB/1pX/mgGbo3ee6H6wH8tBtwtLiWDXuQ
	2FwJvFi9/eNvs8tIE0OMq96rw6pwo6gDDKdMvxHlC2D0BUNEje9j4dn9XEBdmv9eSpvhW9pb75I
	lFW5svQCjKNQBcc/fxv4ftfK8F928t79yz5kQuKzUm9ExYjrsuxcD/uB4AObwj4kyXR3QeKWukr
	esQQa/NXEwwuwSuNdIfBjS8eof32rYY3vjDO4gptFI7AdgsixX3xUflrPlcbbp5M9lgB+uSZKgE
	TcmoNyuNRJ5miQ2FKazRz9s0lKTynyxxLys2mFTzLnKPM8SWhjPIVnD2WOSjN9lMpnP6wmHDOMk
	yaDD4w/36jMkCHGGbxpkK3wYNfRn1lk9KVYDvpfokLu/DxZcfE2352aCghRytKt7yYk9fBxUC9
X-Google-Smtp-Source: AGHT+IF09Ct2a19i2/4DlOkchcDY8fc0W/19PuaW9K1Chf/ju/+dM7hVqpxRi4ZlEXFJSp84dsvzXw==
X-Received: by 2002:a05:6512:3993:b0:57b:4a3f:f8c4 with SMTP id 2adb3069b0e04-5906dd763e0mr9732974e87.45.1760613593034;
        Thu, 16 Oct 2025 04:19:53 -0700 (PDT)
Received: from ?IPV6:2001:4643:2b9c:0:403a:20e1:d8d:be2c? ([2001:4643:2b9c:0:403a:20e1:d8d:be2c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f9241sm7009005e87.39.2025.10.16.04.19.52
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 04:19:52 -0700 (PDT)
Message-ID: <22511014-9482-4bac-b899-668cfc9ead12@gmail.com>
Date: Thu, 16 Oct 2025 13:19:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-usb@vger.kernel.org
From: Johan Korsnes <johan.korsnes@gmail.com>
Subject: Incorrect SDP default current?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I have a USB device (gadget). On a USB attach event, I will perform
negotiation to determine the maximum charging current. The flow and
order of precedence is as follows:

 1. Check for Type-C 3A or 1.5A
 2. Check for BC1.2 DCP or CDP
 3. usb_phy_get_charger_current();
 4. Use always safe 100mA

The purpose of step three is to see if we can bump to 500mA (USB2)
in case we are enumerated (USB_STATE_CONFIGURED). My problem though,
is that the usbphy sets 500mA as default for SDP:

#define DEFAULT_SDP_CUR_MAX     500

Hence, when I f.ex. connect to a USB hub with no upstream host port,
I still end up drawing 500mA, even though my device is only in the
USB_STATE_POWERED (non-enumerated). My understanding is that in this
case the device is only allowed to draw 100mA.

Have I misunderstood the USB standard? Or am I abusing the usbphy API
by using usb_phy_get_charger_current() in this context?

This question relates to another email which I by mistake sent to the
lkml instead of USB list:
https://lore.kernel.org/lkml/46facf7f-de3e-4cb2-b452-df7ffe9b474b@gmail.com/

Kind regards,
Johan

