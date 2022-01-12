Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEBC48C01A
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 09:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351692AbiALIlV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 03:41:21 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:33181 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237949AbiALIlQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 03:41:16 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 2206D5C00B6;
        Wed, 12 Jan 2022 03:41:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 12 Jan 2022 03:41:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=1VPUQ98CFooz7w3tn0vaXauZFxH
        VQ/0IjrIBq+0zENw=; b=Vt5qYQcqpKsqW8tDu3amnpuK2PtHBm+OUJrI1TWvsma
        UBBwSKwkqEgtDjp3qFFtCt5s2eyPD1g5CL3TPEzGnE4nQUTQ2Up5V1IoH4pyfZXJ
        eDCzCsZjUNAE5V8UoT6OOFL36wQDsSqeGgtsu4Pl9EoLNpu3XkbOBVjqmQBBFYgi
        m3Jl8TkMkwO1b4ygb5YQ/ExDiozhpkzjHJod41q0BA8pOavTrGH4V3oTGd/941o5
        CoBpwYj6iv+7z5yFz0ww6BPK4KZRo6yRb4fNXeLiQnlIUj86Z70mYAerGnU7H20I
        67CQmlaoHPGCb5kkDN1b/DH280HhjILeuaufXCGOuig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1VPUQ9
        8CFooz7w3tn0vaXauZFxHVQ/0IjrIBq+0zENw=; b=F6rVydSVXmCACtAhXrWLkB
        Ldiq9SyRPi5MWvWLOlSo8gqkgHDFFEXqc2T0PTv7eME4/ZKcEjvINFdQ+l3S1oxV
        OZeve0QOTQr987flElFII55IwJT6dUgh8ebZY45m5rXJeRx9RrE71hhRmbutvjxG
        nhj81SiHpKS/ygNlXSjaza6Dn65FtZdKcFure5QHyWHw8Nkva/BqQ63EQiqfFviZ
        e12OoRp7Pgn2vP7TVsx6sKXGEhRJsWTk6Dqw57gk/jbvlL8+ybe7FgYvZffTV+EB
        BwbN3S1AuYGTfBD0FfZf4kYeWN5fyDbncq0cjG8V3fL4QC0qsNmkIz85r8n9UNcA
        ==
X-ME-Sender: <xms:KJTeYdg61wN1wXJhWW9ymFLzJyHZDzR5yIMnIG4U44M2fSyQJpOP2Q>
    <xme:KJTeYSA6mNi-4sh1CGonix3byoECQRGykvt8PDLB2jntnhMS2F7P7qB87IwaKG_Sn
    DPN_YCZhm53cQ>
X-ME-Received: <xmr:KJTeYdHX6UmEpz5vKIr4FHO6OvFVGlhOxpTSClCybWx80anfBiIZTtgiAJ-HZWuqHv_6DYd7_KPAFiofuymasvPbKwgbxa36>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehgedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeeuleeltdehkeeltefhleduuddvhfffuedvffduveeghe
    ekgeeiffevheegfeetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:KJTeYSQWBgh-OCxKWAuJV1Ft7nsgX1luzpKyYXZMNXZOYl8AF3bPrQ>
    <xmx:KJTeYayJ778A1vIIHMxwLHh0UWBlDx2o9MDiYED0YfN9nA_rDVkUXw>
    <xmx:KJTeYY7CJIJWshP5pvHuTiQiH_SO20NqBWXE66aW5fJeDmQx65PrHg>
    <xmx:KZTeYV-gCfsFKW1eo3egFvVL8E0jKmoZfZeV0eCJhGk-nIp1Ga1ilQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jan 2022 03:41:12 -0500 (EST)
Date:   Wed, 12 Jan 2022 09:41:09 +0100
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 215475] RMNET data connection speed would be reduced to
 about 80-100Mb/s from 150Mb/s  if try to re-connect it
Message-ID: <Yd6UJV374cX0VY3s@kroah.com>
References: <bug-215475-208809@https.bugzilla.kernel.org/>
 <bug-215475-208809-TGUyHg4aYE@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-215475-208809-TGUyHg4aYE@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 12, 2022 at 08:03:34AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=215475
> 
> --- Comment #2 from slark_xiao@163.com ---
> Hi Greg,
>   Yes, it also happen on 5.16. I tried it with 5.16-rc8.
> 
>   May I know what do you mean of 'usb trances'? USB protocol analyzer log or
> tcpdump packages?

USB protocol analyzer log is best, to compare the data streams.

>   Actually, I do the same test with another Qualcomm modem device (not the same
> serials), and issue can't be reproduced with that device. Seems issue comes
> from firmware of device. But we can't explain the difference beween Windows and
> Linux.

Then please contact the vendor that wrote the firmware, they can help
you out the best with this.

good luck!

greg k-h
