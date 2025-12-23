Return-Path: <linux-usb+bounces-31717-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0B1CDA697
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 20:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B07E3300F719
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 19:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EF52EB5A9;
	Tue, 23 Dec 2025 19:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fbengineering.ch header.i=@fbengineering.ch header.b="OLE2IDHg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1933A225409
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766519346; cv=none; b=nWWtQ+U0cuC//t26IlIbOyRE/0EERF6gzyKpTQWibGIPxzI6dxgcWWXQOAQAD48RQxyu9GHVHCYSHmIzHDLdzQM3eOdpMCHvORLi0nBWJfisdkPo1686EbAu4KlGl0BJ/vFg7Ri8eLuTtQW4fwFB75EStoICa7Yv9q4YQO3ePvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766519346; c=relaxed/simple;
	bh=wCBKVGFXs37f/ebeUUbxojZSNW/DgwoWSbQJYbG8Egw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type; b=eO/0r4MT3uhMcQa73fQf7Bxuw/HDzo6jjd4ssqTHpAphYg23tRM8vlic4ppBOjJnPrVZh64j4PV5/1JJ4jVWhI5q48JghVz4R4xf5BxOE7zdF8NQXDn3TUJdcJCAZkLzVj20aYHQD9rqs9jYREknvEyKXuIPRn0vglk/Z8OvoP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fbengineering.ch; spf=pass smtp.mailfrom=fbengineering.ch; dkim=pass (1024-bit key) header.d=fbengineering.ch header.i=@fbengineering.ch header.b=OLE2IDHg; arc=none smtp.client-ip=84.16.66.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fbengineering.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fbengineering.ch
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dbQYZ60VFzDlT;
	Tue, 23 Dec 2025 20:48:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fbengineering.ch;
	s=20220212; t=1766519330;
	bh=qzqQ+fQOaa8t6swjF7C7Dy5OclUz6OJFgAhcoEc0g1Q=;
	h=Date:Subject:To:Cc:From:From;
	b=OLE2IDHgEFNlMUavCoxXdhxhCO6a3dXffaTydG2gr6fOKtWMeVIcR3S2TY8jUKhFV
	 Jq59nDj6gOaPU14XY56eAVcjUfxCvtgqfDf2tEzdQlf8niuiXu390Oejah+ovgEmqf
	 nTad32mH8CqmSmClQOF3QAHy3x5IdlwVh6iKQ0X8=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dbQYZ28VqzTJj;
	Tue, 23 Dec 2025 20:48:50 +0100 (CET)
Message-ID: <b59edf1e-3735-4d16-84d7-631bc0ad81da@fbengineering.ch>
Date: Tue, 23 Dec 2025 20:48:49 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: USB Audio: AlphaTheta / Pioneer DJM-S11 (2b73:0037) fails UAC2 clock
 enumeration
Content-Language: en-US
To: alsa-devel@alsa-project.org
Cc: linux-usb@vger.kernel.org
From: Federico Beffa <federico.beffa@fbengineering.ch>
Autocrypt: addr=federico.beffa@fbengineering.ch; keydata=
 xsBNBFgAga0BCADIY78eSt/I4vGPo/UMBMQhcM8O2tptvlN0B2F6Z8sDAOwgWnQpd0x2AVM8
 I39VymnmbEQfWf/Y0U9XJqrmOz91NreTsZUsR9BSZy1fVIUbdoQTI8m8CGpjDBnloX+cQwwD
 PDS2RL2/a0rZciXUMunVvM/o2zLHUIyO/GeoqKN5mU4d4nZYPHtBOBpmzfvfyZLM1uyu/flb
 KGFqW0uKmS8MQWhyUdvIsiAU/Aofuf0dVp2C/Z5w01Vyw38fReZ20onxbabSjLrOT+K6vzrV
 /9P+6435Ptoek+5BoQX50f+cMYq4d2rE2PBenDy4xAloL/qOUj6XqwW9ZWAkLLiqYiJdABEB
 AAHNMEZlZGVyaWNvIEJlZmZhIDxmZWRlcmljby5iZWZmYUBmYmVuZ2luZWVyaW5nLmNoPsLA
 kQQTAQgAOxYhBDd0gCSID9P/3KLJq1iTbg4vG1pMBQJjXqXsAhsDBQsJCAcCAiICBhUKCQgL
 AgQWAgMBAh4HAheAAAoJEFiTbg4vG1pMv1sH/1K4SI0+6tmpPLGwCUqpeUk5AScmqntZ41rT
 9W8XF1QgZVsgSqFrVfQLpW+MC5VoMJJmdcPLD8gLLBhViavw8LrQzO8jO90US70MnUnniFB7
 c0YabBsd2cGa25a+LOZ/f1lZCtHvlq46Trxcn9DM+pfexlM6AyN8+FGGIstSwXC96AOfr41U
 lSQqaLbD9ecf+VzPvOPozKLOpQaakuUFLeo9KB1VmK3UxWU3JQ96fJ+Aw8PXJLJFH8bSK/an
 OCzZPPFvICGUcqBKIDirUKzRyiCHQaUx9MGVtZEWsrZeA1ZE0sNa3wIfG0DQ9tUnPHXAzxoP
 Lbni2AHCs0m43Rp7DDLOwE0EWACBrQEIAMsqA2oLmPYfdE1uhsOfDDrt72Lx7BADKqhzk8Nq
 ny45ISPe03MjOkVUwuClceuZDGByZ/u7fslcWvAzcjcLDO4thWj1a9s1PUmH5evVBfFQNaHa
 Z5gdRdIuE+O/Vkv+pbbcR1zckBSj4PCZCBF2rQgukxNaeRB4rTAC0VgozLRK/OgDV8nyCA/0
 Lx1GAFoUj+KgIIUI0mPQzPuCMJHBoOVoWQit9qANTQN089P/6r8dj/3AVPnUmnpENul1gtxa
 2k7ck9F9hH7ePD3djL2tYtQcH720eqrV70KdgSp7Q/N4Kujw7b9RgNmo2cUuTkRfiqR+grp7
 XR9BD552haU8a5EAEQEAAcLAXwQYAQIACQUCWACBrQIbDAAKCRBYk24OLxtaTBr5B/4vmneq
 SuuMYmWcurgk2sv+WKky81Q0z4OkXfwBVz+H6wdpmij0de6ZMbFqD6GjtsAMmEXKdQtbElcr
 yibSXJSCcF6zd534yOdkC0ptOH09thCE8SoZQ6QLQ+wkcqqCBQSNujN+TNG3L7a50p91wLg1
 AXYXF+cOJ2bND8p3g5RjxGk4EEjTHycc9BMA1SRvAZsJG7WB63q1oKPwdVPy7FnNvV6HOR1D
 Jeh4Fkmq0cJCoQ6AOQ4AhVBRXv74XT+rnjVblT3ISSEyneF4IfsztGboIzac7M/2czPyFWuI
 D9mjiEcRbormFsV0Pz3huJ4AMlmCb/96ZKPAWQYVa7EmPy5Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Hello ALSA developers,

I am investigating Linux support for the AlphaTheta / Pioneer DJM-S11 
mixer and would like to report the current behavior and ask for guidance 
on possible driver or quirk development.

Device:
Vendor ID: 2b73 (AlphaTheta Corporation)
Product ID: 0037 (DJM-S11)
Firmware: bcdDevice 1.05
USB speed: High Speed (480 Mbps)

Environment:
NixOS 25.11
Kernel: Linux 6.12.62
Driver: snd-usb-audio

Summary of the issue:
The DJM-S11 enumerates correctly on USB and exposes AudioControl, 
AudioStreaming, MIDI, and HID interfaces. However, ALSA fails to create 
any PCM devices, and the mixer does not appear in aplay -l.

Kernel log shows the following errors during enumeration:

parse_audio_format_rates_v2v3(): unable to retrieve number of sample 
rates (clock 1)
Quirk or no altset; falling back to MIDI 1.0

As a result, only MIDI and HID interfaces are exposed; audio streaming 
is disabled.

Descriptor observations:

- The device advertises itself as USB Audio Class 2.0 (bcdADC 2.00, 
InterfaceProtocol 32).
- A CLOCK_SOURCE descriptor is present (ClockID 1) with Clock Frequency 
Control marked as read/write.
- No valid clock rate list can be retrieved by the driver (GET_RANGE 
appears to fail).
- Audio streaming endpoints do exist:
- Playback: 14 channels, 24-bit PCM, isochronous async OUT
- Capture: 10 channels, 24-bit PCM, isochronous async IN (implicit feedback)

 From inspection of lsusb -vv, this appears to be a case where the 
device advertises UAC2 but requires vendor-specific clock initialization 
before audio streaming becomes usable. Without that, snd-usb-audio 
correctly refuses to expose PCM devices.

I can provide the full lsusb -vv output and additional logs if helpful.

Questions:

1. Is this a known pattern for newer Pioneer/AlphaTheta mixers, and has 
similar hardware been handled via ALSA quirks in the past?
2. Would it be acceptable to experiment with a quirk that forces a fixed 
sample rate (e.g. 48 kHz) and bypasses clock queries, for 
development/testing purposes?
3. Or does this class of device realistically require vendor-specific 
control handling beyond what snd-usb-audio quirks can support?

I am interested in starting development work on this (initially 
out-of-tree) and would appreciate any guidance on the most appropriate 
direction.

Thank you for your time and for ALSA’s continued work.

Best regards,
Federico

