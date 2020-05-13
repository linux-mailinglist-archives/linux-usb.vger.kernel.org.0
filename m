Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6EC31D193D
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 17:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729257AbgEMPXH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 11:23:07 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:38339 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729153AbgEMPXH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 11:23:07 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 9AB5E738;
        Wed, 13 May 2020 11:23:06 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Wed, 13 May 2020 11:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm1; bh=EKgBPAFq/YzpK6kpbwJl7Z5MErlNp9u
        Wq1xHQJulkPg=; b=KDkRFRPXiJEqmsHqpJwifxD3z4gqY0w2nCjBlAPCdYCyNIu
        6wWlEL5neYgAqX8RV0lzxAXPBdJtC98E3hY5MsvbzgmXNVr6n8O0HtL7c6SWpa6g
        KR15BuIVAAbAVsPmjLRaNb+O5YKos2sRYg1rJyudOx/5WWmYNaEXWkd25KVJo9iP
        dxVqQ/rzvl7hRcp6nU9LoLyW4o/8HDA6e2xkgLv7DthXkV2/p/7fj0pgXVDRAFdl
        I/y1RUWMJgMaiINNPT1Md/y5i1o1uD1509LvmT6WVUlNte0vBKEdfz2CIR6FFbev
        Wvokbjp2YYgQCrEcbq5iWT4CD/Acco/xD6nCadw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EKgBPA
        Fq/YzpK6kpbwJl7Z5MErlNp9uWq1xHQJulkPg=; b=kTIVhiruzDF5OSeLjEGl50
        wkLwBydsrYONmAy15XTTQWZRtXPma8kzzc4dly514rVPJ/SdztWaECEmN9KgPXII
        0If01ZdPq7a3YAQ/N5JeAPg/oyZyfjKP/DsreeMZFAKili2pBNZFGNMAkcfTyWIc
        MUcoGBq8rnMFXFvd9fPsufbbg3OQSKlnnWT/Gp33RGMjTZTZYH7G5uT1lfP7b5Gn
        1F9U9ykEzBOipterFWz7xP3BVhaMyW/u5BVYiftHMUDrUUP3wVOBV0GwPRIMHnV3
        DYGcYTRq6uScO+mOMT1gaAd16A6UgaVPiDNs151NUbNMjJLUHDzBbRkwQxJlw8nw
        ==
X-ME-Sender: <xms:2BC8XpqwGD6mcIvPSLVZIa7JP5MCAHJCotHpJ5pOrPzOUKjnXQbUqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeggdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhiugcu
    ufhprhihfdcuoehsihgusegrvggrmhdruhhsqeenucggtffrrghtthgvrhhnpeevgefhve
    evteetfeetkeejjeehudffffffhfeuffelhfeuffdufeduleejfeeugfenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihgusegrvggrmhdruh
    hs
X-ME-Proxy: <xmx:2BC8XrqpG0E26YnVW1xRsNE_crK7cloHsWds_WnKpdqUKP3UgHhDXQ>
    <xmx:2BC8XmO4HE7xq5bU2S2eTqBW3dSHk9KzY2LNSJCLWp3ER5jAMMCclg>
    <xmx:2BC8Xk7gCioPcL6mUQdxEmUYFMiJdwpf_ompI40CuxuKnxyamP6Ujg>
    <xmx:2hC8Xthe1TNOzfl1Gp9wr4t2p3zWB-mNwHYIiEv8X0az7T6ILGiEvQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3C39E66008C; Wed, 13 May 2020 11:23:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <bb16e374-3d9f-427c-8470-3542dc697fdb@www.fastmail.com>
In-Reply-To: <CAPY=qRRFV4SpNO5pb9vF=U95dbA_gN2ngP+vm34884NMk5q8gQ@mail.gmail.com>
References: <CAPY=qRRFV4SpNO5pb9vF=U95dbA_gN2ngP+vm34884NMk5q8gQ@mail.gmail.com>
Date:   Wed, 13 May 2020 10:22:18 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Subhashini Rao Beerisetty" <subhashbeerisetty@gmail.com>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>,
        alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
Subject: Re: sound over USB
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 12, 2020, at 11:43 AM, Subhashini Rao Beerisetty wrote> 
>
> How do I use it for playing and recording an audio?
> 
> Basically first I want to gain knowledge on set of test cases I can
> run on ALSA and then learn ALSA kernel modules stuff including
> snd_usb_audio mdule.
> 
> So please guide me by providing related documentation/Steps.
> 

Hi, searching for an ALSA tutorial will get you far. However on a modern Linux distribution you will likely want to target pulseaudio. There are other libraries like RtAudio or PortAudio that may be easier to use and are cross platform.

ALSA seems to give the most reliable results when enumerating audio devices. This can be done when pulseaudio is installed. The pulseaudio results are harder to interpret.

In my experience, and not necessarily targeted at you, I have experienced massive difficulties getting RtAudio and PortAudio working in a reproducible way. ALSA is the most reliable but an unusual configuration, and pulseaudio is a hot complicated mess.


For what it's worth, the sound API on Linux is so pointlessly complex that I have, in the past, created a custom USB driver to avoid going through the sound API. It was easier to use libusb and get raw samples.
