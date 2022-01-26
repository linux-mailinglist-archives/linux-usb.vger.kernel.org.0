Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96BDF49C9B7
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 13:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241328AbiAZMcA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 07:32:00 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41929 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234212AbiAZMcA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 07:32:00 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 7E5085C0101;
        Wed, 26 Jan 2022 07:31:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 26 Jan 2022 07:31:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=Z54iN+sJjLK45jxxBnsEGwxzVRc+ECRK0p/Xms
        cFfQg=; b=CQPgh1DhPXLQMDzw3x5a8vHJNSQCh3nG5GXh410ceRlsSbFZs9Atjc
        1ywyUKKTqBh4QafdRc1+RRWdJgS0yOqm2ysxq+WZ+x25H4nUprKCzRXVfsQ7G6sa
        eHPuDm18/GPucz1UjSORIRcX7oEVnjrBjdoUFQatww1Bhm6ZIMFniOdI5r3ir8SX
        sEv/Oi7CH6t5PqulPliQCxowIQcdmhglDTZfqnMBcqXGDD4wv90X9ifn8phKdH9y
        iapJu6XmO+hZpRPpGTcFqm+nuYBykGGkl0OTBGvtM/sPlJ8nKhM86wHmsZDx4tof
        RaGAffYfuWLq1ZLTE+ohpkglzVrtNHDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Z54iN+sJjLK45jxxB
        nsEGwxzVRc+ECRK0p/XmscFfQg=; b=BWOjmnuNhCj3ChbbPHahHuTaYYrCcswrR
        ObslKhJBRaJIRPiXPk4lF5F/cBzj7HvSdcLrngFRVS+2qYfrBD9Ffr/2KPOeEX1m
        UspfgChEIwAGITDbNz4Ab+B74/Uqn47LD5JqynQRdX6BBTu0uTjFK4p62DVBDa8+
        Y7wNsdwdN0mGN9uKiRH3D/tPB7IyuO6mEiUsZpLZXTXIRroLLtn0ZOu2vlKuc5/C
        7R/q9XFpCq6c2ezcgt2gNOE42UoEYhnAn8F7fDrOsHIjLuFdcqTueWKsnS5tr3B3
        27pUEwXIts47OHvsq2e1s3dm35oxKncmvprbcdXfa9GzdCodDc40g==
X-ME-Sender: <xms:Pz_xYT0dRjUsuqQTORA-T755aEsIJh6L4b_WQJCo8aPChEIoQCqbkA>
    <xme:Pz_xYSFdUc-45HgBL8hyhC_CUPs_RTMsDaAWupMNP8les34LFRPv6cIH_GyZpVHUh
    hb4mVNw5w0j5g>
X-ME-Received: <xmr:Pz_xYT6lHM_BOQXq_klJkNh7ZM9Hnh8KdGjyQRo8ycen22ogcMczLTb03vr5K64Ww6RHlEh48Rs7XmiB5L9pocljxCa0rhuy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfedugdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeeuleeltdehkeeltefhleduuddvhfffuedvffduveegheekge
    eiffevheegfeetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:Pz_xYY17s0kgW1-2cdSWPtbBO7Sa34Olc8Gpa8CnGK66VumS3HvhkA>
    <xmx:Pz_xYWENrAqxR4ijB3tOu6Ci3qNY5cHIDQyWYqIQecGh1FP3lsm1Yw>
    <xmx:Pz_xYZ90mRMck-dGMuq1lwqRbrbw6XJHMAKUhsKXIKzFhGpQqs8qVw>
    <xmx:Pz_xYbQFTSf-WAdQ4gp1w0FoHdMWvVsLxN164KFxXVkI9oNQhKZ3zA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jan 2022 07:31:58 -0500 (EST)
Date:   Wed, 26 Jan 2022 13:31:56 +0100
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Message-ID: <YfE/PNf/khUD1ZYi@kroah.com>
References: <bug-215361-208809@https.bugzilla.kernel.org/>
 <bug-215361-208809-e4bAGJUzcD@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-215361-208809-e4bAGJUzcD@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 16, 2022 at 04:23:55AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=215361
> 
> --- Comment #6 from Ross Maynard (bids.7405@bigpond.com) ---
> Hi Greg,
> 
> I found the patch:
> 
> Bisecting: 0 revisions left to test after this (roughly 0 steps)
> [16adf5d07987d93675945f3cecf0e33706566005] usbnet: Remove over-broad 
> module alias from zaurus.

Great, can you send this information to the linux-usb mailing list so we
know what id to add to the driver?

thanks,

greg k-h
