Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80555311D90
	for <lists+linux-usb@lfdr.de>; Sat,  6 Feb 2021 15:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhBFOGn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Feb 2021 09:06:43 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:35253 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230020AbhBFOGm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Feb 2021 09:06:42 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 37C515C00F5;
        Sat,  6 Feb 2021 09:05:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sat, 06 Feb 2021 09:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=rHpjJI6ZDaTXhRGz4gSnpOA+QoM
        Er7a/xpigfJ/1J3M=; b=wMxQLcf/2TeDHKIizvoUrz/qlmSHEyBdmmCVGyRJcHF
        GOwj8B5ALogYc32djy6ewk7pq77RPlJX3rGKOTXkzQwdijqiBEcrrZuIppT9OAzM
        qKus8DLbevORK2dyfKvIM1mF0HjiO2/vWQnZK9QxYDLTvlrXyh9enabgtN/wlrue
        yQaJWpbtC8ov9JM38lSjpwsQb6E6f9u1fvWKn5KkhmF6ZlPv0RkyUIqQsSdMH8Ti
        WYzdF71rpX7xY5J7t5AMzcYaIkv0dityHpISOIU0n/YYe3si7P/e+d28d4y7G89h
        RIAbLV1NRRHUZAOSTOPm7i6CP69XsCUkWkOusO9L+Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rHpjJI
        6ZDaTXhRGz4gSnpOA+QoMEr7a/xpigfJ/1J3M=; b=wHmpx72mLCMy5naQlgpIF+
        67sJVu6nFZ9Eu7FV4CFXLmIKp2UVH6tMrqMgzh5PdvWEf6dWOMXTR95z/dEGI4ll
        R/U/GEjeuZ8ez0azitL4Agc1QgeZnlhjShpNVNHh2JGM/f2Y5BFeHUETaJ7tu37T
        rEM+ZXOISBxRPhUrEhQMEhIZrfhiTXNXFLANVbxum5La1dJcSp9LuPc8s8icdk5f
        fdxHklevHgHupCk9qbVxSne7dgJGmcf/HZNXQcMWSMLXVSUPrVslcDQpNg6GpI9y
        Cs3GMxClBku62fVQlYfWRtHK26eOJXSSn2EvEXBhzFSjHLbCxuD7Zfzb9o48UR/Q
        ==
X-ME-Sender: <xms:Q6IeYAF0jEbHs-wnRklLxHupNMEkwJh2llXvYil9rGanfoI_7NQ_7g>
    <xme:Q6IeYJVm6FDSRn9PA7kv2A7Bk3GQ7rFWIQxAHIv43Jt3ny_J3DWUrCK3TO0OXB8HZ
    QzXp708MiUzlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgeekgdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:Q6IeYKLj2f1XFdqP3qkSj_y4EVmOVWHHqQ97xQ3nqW2sNh-IAhRqWg>
    <xmx:Q6IeYCHkhHJoQIOe0dylWkTjm8d354ydFjzy0ksnvya1f3wpnXG_Fg>
    <xmx:Q6IeYGWMOlACkAw9Dl-IeTA8cL0Y87PF1IRWG6pndmOK1_9xv99N_g>
    <xmx:RKIeYEyhGrPtG5qEsU_sPVPecQamoCwhgT327mxoACq7U8xjwc8mKg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6849D24005B;
        Sat,  6 Feb 2021 09:05:55 -0500 (EST)
Date:   Sat, 6 Feb 2021 15:05:53 +0100
From:   Greg KH <greg@kroah.com>
To:     Prike Liang <Prike.Liang@amd.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@intel.com,
        Shyam-sundar.S-k@amd.com, Alexander.Deucher@amd.com,
        Ramakanth.Akkenepalli@amd.com, Jack.Xie@amd.com
Subject: Re: [PATCH v3] usb: pci-quirks: disable D3cold on xhci suspend for
 s2idle
Message-ID: <YB6iQTE059WnBiPB@kroah.com>
References: <1612527609-7053-1-git-send-email-Prike.Liang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612527609-7053-1-git-send-email-Prike.Liang@amd.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 05, 2021 at 08:20:09PM +0800, Prike Liang wrote:
> The XHCI is required enter D3hot rather than D3cold for AMD s2idle solution.
> Otherwise, the 'Controller Not Ready' (CNR) bit not being cleared by host
> in resume and eventually result in xhci resume failed in s2idle wakeup period.

I do not understand this, can you perhaps rephrase it differently?

Also, please mention the specific hardware that has this bug in the
commit log, or on the subject line, as the subject line is saying that
this change is needed for all devices, when really only one is broken.

> 
> v1 -> v2: drop the XHCI_COMP_MODE_QUIRK quirk and create a new one for handling
> XHCI D3cold.
> 
> v2 -> v3: correct the quirk name typo XHCI_AMD_S2IDL_SUPPORT_QUIRK -> XHCI_AMD_S2IDLE_SUPPORT_QUIRK

This goes below the --- line, as the documentation asks for.

thanks,

greg k-h
