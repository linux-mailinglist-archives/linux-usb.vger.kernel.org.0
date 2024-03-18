Return-Path: <linux-usb+bounces-8058-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E177C87F082
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 20:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 964B9284170
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 19:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D6457885;
	Mon, 18 Mar 2024 19:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="eEXzATA2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T7kYb3rC"
X-Original-To: linux-usb@vger.kernel.org
Received: from wfout7-smtp.messagingengine.com (wfout7-smtp.messagingengine.com [64.147.123.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5FF57870
	for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710790936; cv=none; b=e7ixWbvcw6gUk3GA6rxJ8VtMfiUpIo49/b5K3DrdQKEy/GLH8rd+CSRcDbtFHySgvl/29UDFraLeJBKpibxPky6sb+Rxpjlz7/0YHjI0z95vPIHOo8IWd87+8T7+bFmQR5DGG0VI1H4RmmFwxS3rzHO2d6/OBgwsO0LJSJm62kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710790936; c=relaxed/simple;
	bh=T3wR8h6BdAq98OLP4+OhnaxxQBCl2xzqcIC9qwWT3MM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=uU/TTN6hlv60cxeGKtMyvSLRKqeykw+VydmfDzdrqhEd+071UWMzDzj5PoxZq4UhqwN/qtEkEhYNAY5QE+c/ES3DnXHQZAULpJdgjyNIChtCaZtkwykaW5KtP9qMfNeIhoaeptoYm9K1zdAFldOvNLVeQf37Klh8D9KDUFbOUSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=eEXzATA2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T7kYb3rC; arc=none smtp.client-ip=64.147.123.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id DA2371C000D5;
	Mon, 18 Mar 2024 15:42:12 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Mon, 18 Mar 2024 15:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1710790932;
	 x=1710877332; bh=/7lfG5UlOlE9CM6wPyy0xRCPZoUHXdx++YSPEbfVyx0=; b=
	eEXzATA2MRgjiJsHWbKPbvZjL4cwZCFtQogcA0VSs/zGLjXs0zqRlGCbw2R8a3Vz
	OYgmfRC+XKwU2H1KcVWF5Ya47EfD0lqsYH9AA56RCurhKl8MyGKof9WmyNPRFN44
	UtKqFeLEdOAvumbnGkDOnng0Y5PmguWJsdhtUhNNLkqr+yCXChfKAFNn2cdwLLN7
	xNU+VSgf1XieXpHiNLEeDfyDJKABi7J8s23n5tDDAGBLJajlOSze948LfRb4vWFX
	zyTnl5cLtShsnL0s/g+MwfRtmP/fM+nvSNTH9ztkBs9r5ej0ekYP29zGenagBvBT
	6YcLBYaxCZOB3ckDhkQoBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1710790932; x=
	1710877332; bh=/7lfG5UlOlE9CM6wPyy0xRCPZoUHXdx++YSPEbfVyx0=; b=T
	7kYb3rC4EuKZZU35tF4D+38nrAG/YPYzYXGz2UtEOJzf1j9/3JuB+OTRbAyez4Zq
	ERa52MBOooCeGA1ll4xN3LhQG3Gn+xJgX4ICcKLV5O2DWGj5Md/od7iG/Qa3OH05
	x4CFdYV90k7eMZGCFLt/AJNyZK3NOT1S/TzkecVLw8TVaKMhSvG2mCqXd0UbOQFH
	jD/KIZAvC9zwoEBFZVX5heDHrdH9/4Ht9yMsBUW6s4u9BZ6qRfGzq0INSw98Pzo0
	W+NL0Kqo8qg/9/hq5rJrPuFAmWDqe05IIHjDBGoIIn1RzFIWm8pScMxa+Sfd+yjk
	6cnX1U7PRRv4izv0xjIow==
X-ME-Sender: <xms:FJn4ZdaCvkHycFIiKLUkOWfSAl8JAJOok9_CYn4ZaZdyKmdeCO8z5g>
    <xme:FJn4ZUYV6KC7zJYVVbdFf1qpMtAy_RRZ8_MsZ86FtgVh5dcJquvKnFYh0f1Z4bSf-
    rWPMMdHVf7atK60vlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrkeejgdduvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfo
    rghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnsehsqhhuvggssgdrtggrqeenuc
    ggtffrrghtthgvrhhnpeekffehgfeiudeuhffhteeivedvgfefhfffgffgkefhuedvudel
    leevgeehgffhudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehmphgvrghrshhonhesshhquhgvsggsrdgtrg
X-ME-Proxy: <xmx:FJn4Zf9K1k25PD07bF0TjKoYav6t87ItXzmxZpehq9AXmIiP7cD-BA>
    <xmx:FJn4Zbp0ljViazLyFH-tBwYuSCi85Sd4GVNNDep1-1vMrNh5P9vsJQ>
    <xmx:FJn4ZYqTqiHBdWWXY1pEm_lk-MrvN-W9jSG42lvXK2HkrYpvn9OndQ>
    <xmx:FJn4ZRRqTcZnKlBqdS2CpSPJWivDs8Vc0Ad9WU9lFZHY6Lfj66kzIw>
    <xmx:FJn4ZRn6vQrOPOtGHMJpsCRa5l9QSU6xp114wfb9G5PJq7_6ygrWz3F72_M>
Feedback-ID: ic2b14614:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 057C3C60097; Mon, 18 Mar 2024 15:42:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-300-gdee1775a43-fm-20240315.001-gdee1775a
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <03dbee0a-09e3-4ef4-ad19-c8c4280f2707@app.fastmail.com>
In-Reply-To: 
 <CADS+iDWQxsgvAnkfu8Nukjw5E3d49pwBsWZScyc_HQLGKLwbgg@mail.gmail.com>
References: 
 <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
 <520bd89d-b6e4-4654-adcd-8bb884802f56@interlog.com>
 <CADS+iDVhNzAHfbW+Nks_29rgJXwFTCsTU93XHQpCYBCW6cvxzQ@mail.gmail.com>
 <e7257a7a-1391-47e7-9702-d7c9ec3ff338@interlog.com>
 <CADS+iDWM8czf-D8D8H1gx2YBPCYbO4cexO83dUQ6-H8KKQSx4g@mail.gmail.com>
 <CADS+iDWSsLA+HrFLsD4nvo5KCRJTdiuZKp5cYVkXBnkC_nTfRw@mail.gmail.com>
 <eff9a939-cd38-4cbd-89a4-faebc0de67e6@interlog.com>
 <CADS+iDVAyUXQ-KXHgSgJkO=t3msGs5MhyVkBqcaV_N6SSw4EdQ@mail.gmail.com>
 <ZYFqS+QAl6ZKdPQ5@kuha.fi.intel.com>
 <b696742d-82a5-4882-8997-6acb8cec28e4@app.fastmail.com>
 <64479f78-4359-4eb5-9367-257b24f62ccd@app.fastmail.com>
 <CADS+iDWQxsgvAnkfu8Nukjw5E3d49pwBsWZScyc_HQLGKLwbgg@mail.gmail.com>
Date: Mon, 18 Mar 2024 15:42:48 -0400
From: "Mark Pearson" <mpearson@squebb.ca>
To: "Yaroslav Isakov" <yaroslav.isakov@gmail.com>
Cc: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 dgilbert@interlog.com, linux-usb@vger.kernel.org
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Mon, Mar 18, 2024, at 3:22 PM, Yaroslav Isakov wrote:
> Hello, Mark!
>
> =D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 19:48=
, Mark Pearson <mpearson@squebb.ca>:
>>
>> On Thu, Feb 22, 2024, at 9:30 AM, Mark Pearson wrote:
>> > Hi,
>> >
>> Just to confirm that I've tested a trial BIOS from the FW team and it=
 fixes the issue (shows up under /sys/class/typec
> Great to hear, thank you!
>
>> If there's anything in particular you'd like me to confirm let me kno=
w.
>
> If /sys/class/typec is populated, I think it should be enough... Just
> to double check, is /sys/class/usb_power_delivery populated, too, now?

Yes. From my system:

# ls /sys/class/typec
port0  port0-partner  port1
# ls /sys/class/usb_power_delivery
pd0  pd1  pd2

>
> I also did not manage to see anything in /sys/class/usb_role or
> /sys/class/typec_mux, even with my hack - is it expected on AMD,
> because of lack of appropriate mux/role switch drivers?

I'm not seeing anything under those with this BIOS either

I checked on an Intel platform on my desk (P14s G3) and those aren't pop=
ulated there either...so not sure this is AMD specific.
I'm being lazy and not looking at the kernel code - what would we expect=
 to see in those entries?

Mark

