Return-Path: <linux-usb+bounces-36212-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEYlCusf3WnbaAkAu9opvQ
	(envelope-from <linux-usb+bounces-36212-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 18:55:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 991613F0376
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 18:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6513A305B773
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 16:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7641314D0D;
	Mon, 13 Apr 2026 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="omf6C3Uo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="et/YW5U8"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA01523E342;
	Mon, 13 Apr 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776098761; cv=none; b=otzzcUW3mbVDKStlnOOfbNUZ3u/AOaG3vXLKEtaDQjwxmRVOjRR30rPnrdKdJ/9v6cEdux0cQfv9orkdBAIHOX9y+s8odn97XqwgC2WAknTe4yFahJDQ++GCYx9E7caCRPr+J9LltNGHJ60PMCzJ4Snu5pOr6b902NPUWbmmSlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776098761; c=relaxed/simple;
	bh=S0Ek6YJFg7wBXqi7ZlcSwFPWwAkG5PZx695YElD1T5I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XKN0EcTopCHgjEjoQAlfe9yDPC6z7SBRUMYYcJ1ndQ8l+Z2vcwJGgoRh2jTCKw+u72DmutP5sXnHhKq2QSfjBBpWsV8naMnetsRSX/NPEGtKd1YzN6BR3IFkIkzQ2Lo9aXwB8KdJQTQX7d6Q6cgUr2SxbbX4GxIrncbDgm1NS18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=omf6C3Uo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=et/YW5U8; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D217E7A022D;
	Mon, 13 Apr 2026 12:45:58 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 12:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776098758;
	 x=1776185158; bh=ocGLLCKXZczMQeM4NWKMo54s5SoZcwQdfBFJQMNsVF4=; b=
	omf6C3UoHmh0fHs/khHdjtVQoOZad81OVyHOUCGPpkBmNDCuF8FVSYeiLHN8Cp0q
	cMiguT7QKqzcYBk3jxOqRknV+WNVMxgB3R+GYYYcUYMqSWbNE5HJffUsK8fcbm3+
	pgySJe/8euwoAyNGXlGgGW5a+GtWUr94EFdtMKqpVjIj4YNTWOgEUN7aiPgzI8cM
	NWMaoD1LebRrXRoedLSzTh6mjB32E6SY98IJxYEPtFwjUdV6YE8Pp4+toJthv6o/
	nNT2iPhOB2x97wSOkaFTJObFCqoSOCmPk/wfxB3hXY7IKRWEmifOoTErOu76My0M
	xVOo3l8F9zG3lyhaahVyJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776098758; x=
	1776185158; bh=ocGLLCKXZczMQeM4NWKMo54s5SoZcwQdfBFJQMNsVF4=; b=e
	t/YW5U8qgeHN7zsDY3gbcfBeZVUKMKHP8vlPU+Q/bCg5E9InSKJseX0KITPw4lyb
	lOxiajeyTl/DYxBwD8Cqg2CEDvH9KdVR9xELqi+xWrKqBQLTfd9UAq/tRx2IslV1
	8/1ZbdwuqdVVu7hvvO2+Ip4mESn7EtdzXEp8pWFjlbecYNG0GHqDorVnxNpafn5a
	YzoY7kU7RlGX8S09AAbrP2VvG3XgEqbHSs70/tZ+4tUXkevr3D4PQyn8DWIaZjrf
	NvAEY4ZQVb7XXXEcst3w3gZ8+KVNtkarJA9a+ACpBTnaZEYRsIM/w24Y3S2AOOzt
	JqggdlPwIvI+2CGrtY5qA==
X-ME-Sender: <xms:xh3daRCf_YGSoj6BjIOD4COH9gAXZKverwUVUvwgJebwHkZnT_mp9g>
    <xme:xh3daaXtM5TOWoa17Z3Lied5tylyYO9UgIKnwwJf9pK51TgdiRuhaVPH3e7opLeLc
    oW4Tk900JBLw-J_hvnRqmfPYOrIIZ9cjGydn_z0xt50uOIyQP8p-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefkeejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehprgifvghllhestggruggvnhgtvgdrtghomhdprhgtphhtthhopegrrh
    hnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhdrtghhvghnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrqheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:xh3daWoNNmvmECrtntEYp8ZPd6kgPjNrEJ5jI9o63tzgb4p70EDg6w>
    <xmx:xh3daetRFtLuq1iK2hmzfyt08luEPqQXR-JTdlu14kLp66eivENkQw>
    <xmx:xh3dabFemEPCCDjbhgqw3fbyhlpxp5SIFsMIVgEjz-2jEu1uy63uIg>
    <xmx:xh3daXZSiARC3SEohaRofIBh0_TIFM-7spLD51V9vj5PgshQFnSi9w>
    <xmx:xh3daQA-Kj3ik5_jGLOhJX6c1CV8MDmV7BRNs2nQkWD4bEx3sSricdP3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3D921700065; Mon, 13 Apr 2026 12:45:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AlVvYKQckCPF
Date: Mon, 13 Apr 2026 18:45:38 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Chen" <peter.chen@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Pawel Laszczak" <pawell@cadence.com>, "Roger Quadros" <rogerq@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <51c96cbd-1d46-47ff-b553-5b81efd39067@app.fastmail.com>
In-Reply-To: <adMMm5kS3PR5CHFB@nchen-desktop>
References: <20260402141008.2691819-1-arnd@kernel.org>
 <ac9xVUVB/BKfBUmE@nchen-desktop>
 <26779a33-135a-4881-8614-9987c5e90380@app.fastmail.com>
 <ac+H2dzj5t1JJJd5@nchen-desktop>
 <e650e6c7-bd19-4c35-bcd2-0c53178feb8e@app.fastmail.com>
 <adMMm5kS3PR5CHFB@nchen-desktop>
Subject: Re: [PATCH] usb: cdns3: attempt to fix Kconfig dependencies
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36212-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,arndb.de:dkim,app.fastmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 991613F0376
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026, at 03:30, Peter Chen (CIX) wrote:
> On 26-04-03 20:50:52, Arnd Bergmann wrote:
>> 
>> The only other alternative I see would be to split up the
>> platform driver support into separate modules for cdns3 and
>> cdnsp as well, which would make the dependencies trivial but
>> require reworking of the actual in a way that I haven't
>> been able to figure out yet. If you are already integrating
>> other changes for the next attempt, maybe you can try to
>> come up with a solution for this as well.
>
> Thanks for your suggestion, creating different platform driver
> between cdns3 and cdnsp is the way we used at downstream, but
> when I try to upstream cdsnp platform driver support, I find
> the two platforms driver are 95% identical in content, so I
> would like to keep one platform driver and one binding doc.

I gave this some more thought and realized that the best
way to handle it is probably by reworking the cdns3 driver
to no longer require the separate platform_device registration
for the child device. This would make it work like most other
drivers in the kernel, which helps both with the module
dependencies and with new developers working on it.

The way I think this can work would be:

- turn drivers/usb/cdns3/cdns3-plat.c into a library module
  that exports the probe/remove/suspend/resume functions
- Remove the of_platform_populate()/platform_device_unregister()
  calls from soc specific drivers
- Change the individual probe/remove callbacks to
  call the exported functions from the generic driver
- Integrate cdns3_platform_data into struct cdns, and
  pass that from the soc specific driver into the common
  code
- Set cdns->gadget_init in the soc specific driver

There may be additional steps needed to make this work, but
the result should be much cleaner.

> By the way, are there any randconfigs I could run to avoid
> the similar break, of course, I will pass my local USB
> randconfigs tests?

Not easily, my randconfig build setup works by having a
tree with lots of fixes and workarounds for all the known
unfixed issues, so I can see regressions more quickly
and test more of the corner cases than the automated
build bots do. In most cases, the 0day bot should find
the same regressions I do, but it will take a little
longer.

      Arnd

