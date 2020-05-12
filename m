Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF341CF8BE
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2020 17:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgELPPN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 May 2020 11:15:13 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34713 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725888AbgELPPN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 May 2020 11:15:13 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id E9C8C5C01B3;
        Tue, 12 May 2020 11:15:11 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Tue, 12 May 2020 11:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=5TiQ7+4hvxQaGpYZLmh7oS8xybSfby1
        ak3vksEvngpo=; b=YoD3rmc5cP41nKMXdJeshvGglUrXi7iKLijbK3I4vXoUyiv
        3/6Fd8DasSiPyjikYf/PgjztgX2pP/m53oE57U8kLjTR5GAm5semV02sgBhQsEfC
        ujUmAbu6cXbAuLKmP+bkt2TeDEDOh43dB4aoDQqIUG97mlxRx4uVqlplUQzo4IuR
        UrHMotPVWeUeJAMf71Zk2AKO1TDPPdTo3upDGFjT0iN/THFfSddGpEKo0pPLjv62
        g56N/o4sEDn9xX6lHDP1h5P3U1QEtFduwa5TGUl0y8f/7IgtfzwHdCJZhc7Irq6h
        KII6C6O1Jlexls4njQP0ACgWeHvr95mNtUaEnIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5TiQ7+
        4hvxQaGpYZLmh7oS8xybSfby1ak3vksEvngpo=; b=cqPw2/hQP0ubqVn+fm7X3y
        jvgJ1dNeeVWqoGzctXxvjeJEZN9xnO3L/y03d+ZV7Xiaaswx9syTdSqUZv4e/2rB
        ydxYh3dSytBlCxBFyxODUfcoyXFd2QubR/NHI9mUsmkDstzNWy3gvV3UfNDMxkoh
        A5+VyPzwU8UranGv+FzZkN9wA0MCrEIrxCRmffkNNCsykhIumhE8iUjQcC5+g8Np
        Mnj14yzQb0KXya5l3IN55yoVuBdEX1eZafcxcK8k52QQGHGQL19KZS+bb/JzS9dE
        Jk/L63kofiZuzShalk5nCiK6VBWMGwCV4H6ctCQAknP86o81GOgCI4VScBSSOzoQ
        ==
X-ME-Sender: <xms:f726XpGLKQ0h_OgH7cgDFrvuM2mYBCMCnzVq6v_kxXbrcKcV-mVYNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledvgdekfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhiugcu
    ufhprhihfdcuoehsihgusegrvggrmhdruhhsqeenucggtffrrghtthgvrhhnpeevgefhve
    evteetfeetkeejjeehudffffffhfeuffelhfeuffdufeduleejfeeugfenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihgusegrvggrmhdruh
    hs
X-ME-Proxy: <xmx:f726XuXOtp1iX6ogtUembfGRn5-y4UsuVkfsQhyD20UjLCzKZ1aVIw>
    <xmx:f726XrItNK2WeZ0ZDABD9ysT2VOOLjUAKt6YciYyFBSkUddKXt43Sw>
    <xmx:f726XvHMQGFlenI8UGLnPp_9LhTyeAqJUxW8Pa1lzyeg2WA-_UHbrg>
    <xmx:f726Xnh3T0e_S4GbQwYe97WUdOTgFoghc8usGTibBkIbh63I1ak6EQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8E8E966007F; Tue, 12 May 2020 11:15:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <8ee3914e-7876-46aa-bade-7cf14df7efdc@www.fastmail.com>
In-Reply-To: <20200506091750.GE30237@b29397-desktop>
References: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com>
 <20200506091750.GE30237@b29397-desktop>
Date:   Tue, 12 May 2020 10:14:26 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Peter Chen" <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Documentation for Raw USB ConfigFS
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter, thanks for pointing me towards the ffs-test. Unfortunately after some exploration in that area I still don't see how I would add a preexisting function to the configuration to be handled by the kernel.

I do see something in an AIO test in the host code where libusb is used to bind a kernel driver to an endpoint. Is that something that will be necessary? Device side, I'm still unsure how I tell the function to handle ECM/ethernet on a collection of endpoints.

I understand how USB works fairly well, especially on microcontrollers, but am a little lost still in understanding the Linux machinery for USB.

Cheers,
    Sid

On Wed, May 6, 2020, at 4:17 AM, Peter Chen wrote:
> On 20-04-30 12:08:13, Sid Spry wrote:
> > Hi, I'm having issues finding good documentation for raw USB configfs. It has reached the point I need to look at developing a new driver, but I'd like my unique endpoint to coexist with a CDC ECM endpoint or similar.
> > 
> > Is there a high level description of this? I can refer to the code but it will be quite slow.
> > 
> 
> You could write a user application using f_fs for your endpoint, the example is at:
> tools/usb/ffs-test.c. And add both your specific function and CDC
> function together into one configuration, in that case, the host could
> see both functions.
> 
> -- 
> 
> Thanks,
> Peter Chen
