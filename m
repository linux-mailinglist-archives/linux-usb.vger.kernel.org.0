Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A9C1B5C2E
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 15:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgDWNKQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 09:10:16 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:35921 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726532AbgDWNKP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Apr 2020 09:10:15 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id A8AAD6ED;
        Thu, 23 Apr 2020 09:10:14 -0400 (EDT)
Received: from imap22 ([10.202.2.72])
  by compute7.internal (MEProxy); Thu, 23 Apr 2020 09:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm1; bh=ixgLONNLuhtM08CBER/+H7XDFMfz8cD
        ddl6+aanWHrk=; b=k/LyiAUnu/7sTfMep+CgCgYpPcqgeMZ8k0QAMcy9bLRkmha
        W1QjVgSjG5d5MtS+INpYmqiiyzz4CqOLqOz+7eqXM05KMCNV5Vvy1SWCR8HOijve
        QnmSxxnL6Sgxc8ZnYyORrXhuUAP8A5pwioomeANvlychtQYxmyd46kS4aNLhrXuQ
        a2U0h8qyWmMpDMhCPXDTUZIKbBd8WYEAfEMFprgsCC1QPT8Wjs9bDWrtmXjE+RzT
        0gIySKajfCyid88Qin0/Zidt6ccwkh8XpuxiU0gFj3Vpeo//A2NuqEkHVSpEurv/
        agCcF9YriT/F65//lwjPtRlefnF7wwDGsgRpULg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ixgLON
        NLuhtM08CBER/+H7XDFMfz8cDddl6+aanWHrk=; b=Q8MYvurY3orR92BHvfIwTN
        BjiTvnsSd1hn0WRBWGyC4KmvQ5ULprOlG1F4yLBnNDoiK4h5h0tkY9NU7908CcHq
        BGH81cCE/ufbLXTpfrwnthK6f8j3JjuQuvLgGYxiMSg6VOJTgAt/XL14iOJlAuBV
        nuCPnxgm+2mNDH9pGL2cTt+uSlFH17W2i6lfMEQeCwsHn+pZgCMbCQa0/1i/s/9H
        V1b4JsZtpyczr2DVh4dfg9PqmvmZdHk6bFBuG8ztGm6gGmkroqwgplYXQh2i+CAq
        Z1RVg3phGurfI4kR5DaRABDQUibuHW3s2V39EiWDuIJG2rMq7c1ji0qgdi3f4YLw
        ==
X-ME-Sender: <xms:tZOhXpXaIgobGTAJs6cmjbddCl9B9PYqvn46xiegncpU1P_zLaSE9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeelgdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhiugcu
    ufhprhihfdcuoehsihgusegrvggrmhdruhhsqeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:tZOhXhNLb8zm-vNkJJs8fmIKA3O3mrOGUuhuqjNAeO_OkbQSmnY9Pw>
    <xmx:tZOhXjAEw0bCgqgTk3cf1uGwoWFZTua_XOwt1XzNGCVVnwQj5_xR8w>
    <xmx:tZOhXmemmGa1cJ0y89DjCYYJNi3Ncabu1M2EqmfhUVbRNHRtyH5PCw>
    <xmx:tpOhXkddd-_W4lQkdH9J8qV-MbgOe_r1w2oqqx_4gOuYL5uGdfXvuw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id BE13A6680073; Thu, 23 Apr 2020 09:10:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <cf2e697e-32ad-490c-a646-a18cc1740753@www.fastmail.com>
In-Reply-To: <SN6PR11MB324507C7828C86B7460EDF11E3D30@SN6PR11MB3245.namprd11.prod.outlook.com>
References: <df1fe132-79ac-4656-9ddf-040e26f11c28@www.fastmail.com>
 <SN6PR11MB324507C7828C86B7460EDF11E3D30@SN6PR11MB3245.namprd11.prod.outlook.com>
Date:   Thu, 23 Apr 2020 08:09:49 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Gopal, Saranya" <saranya.gopal@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Failure to Assign UDC to ConfigFS Gadget
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ah, thanks. I actually tried that, but must have made a typo a couple times in a row. At least now I get a kernel bug printout!

On Wed, Apr 22, 2020, at 10:28 PM, Gopal, Saranya wrote:
> Hi Sid,
> 
> > # stat /sys/class/udc/musb-hdrc.1.auto
> > File: /sys/class/udc/musb-hdrc.1.auto ->
> > ../../devices/platform/soc/1c19000.usb/musb-hdrc.1.auto/udc/musb-
> > hdrc.1.auto
> > 
> > If I try to assign the UDC using the string 1c19000.usb I get:
> > 
> > # echo "1c19000.usb" > UDC
> > bash: echo: write error: No such device
> > 
> > It's at this point I'm lost. I appreciate any help.
> 
> You need to give the exact name of UDC as present in /sys/class/udc.
> So, try this:
> echo "musb-hdrc.1.auto" > UDC
> 
> Thanks,
> Saranya
> 
> > Cheers!
> 
