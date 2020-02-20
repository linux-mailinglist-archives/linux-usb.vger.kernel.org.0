Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC20165AE5
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 11:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbgBTKAY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 05:00:24 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:37777 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726839AbgBTKAW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 05:00:22 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 4D6577D3;
        Thu, 20 Feb 2020 05:00:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 20 Feb 2020 05:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=/8JMCv7pAqBJrkTqDKoIdGx8AFO
        D2ePTE/E0TdvMD6I=; b=FWI5nPt5qzVlGtHb/bBA5B1MUY1USb+6uf8emCNSq3c
        kszQlqYA3mhWtvcHceqgnN5MRjl+6O3zwuGWPnooH6/2zbfpssUZsC93YZEnJ4AP
        2C7Mjee/HG49RzD1TsQzaKRf8ldeyHUUKLd7xTDqH4+yVrA/ymSIzKPztWKEjdwO
        QcHEJrVrWBsrSBusVVuKfRKsMszQKEpwbagY4fkDCbPzDysi4HByQyGWhZM+qwsb
        2Y5whIZGjcSgsfiyhM85C41lJeOIBh8DR3mK2+94hhZ8MPipkpuZvr3/Gxpwsz0x
        3InR79fi2xvTqAQzVHxa+cjhku0nuPGZi/BFRd4rX+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/8JMCv
        7pAqBJrkTqDKoIdGx8AFOD2ePTE/E0TdvMD6I=; b=h7F5a38nZrgy5Ym083rJi2
        fu+BqyfyUdNeuNRk6SKBPRvduR1DHbfDrkF56ygo8vhhECrO7ALfvHhoXKNY3juy
        mpr+RE+SbRyNYFh6GBhZbyMZ274Yh/QVnqCia2KiRi4fW5L8WF0Lk9+LcAdUPcCD
        dliGVb9jY8JL7eWBF8jErNvuspwWQAYq2rjwhQ5bRJpoQ/O/XOm0OHYRoqNBOdma
        JFNqIIE+Hnpjb8kxhjvS31nwZWNVjdgypAEbz/GqKVmaB/Oen5iaITsnR92w1zbc
        Nz4tCdYXXbk//KiQem+wntnOkqL4znGJq9ftaGWmz517KjA2HZMWAogn7gcmn1ww
        ==
X-ME-Sender: <xms:tFhOXqFhR2QZTquVSvToikcT4QyfattWagyLho2_G-YeO-LFFAfKBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledruddtje
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgv
    gheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:tFhOXjhI-TR0n3VJivaJ8JMEgp4wUux-Pa7KKiZvqkUhxpP-8zWR9g>
    <xmx:tFhOXvvRIDJ9VD5NlDvWiM50zECQ1sbDqwNpUWESXX6YWQZ-LWgzpQ>
    <xmx:tFhOXutvfXTCkTfRkyV5qyWB8mEqBiN6JU7nZRrJQ3kLF1Uoovg6Sg>
    <xmx:tFhOXl5KkYnni8mayzdtwuGlecIn6IzJ64ma9yUJLcL7eICM7lvCCQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 32D473280060;
        Thu, 20 Feb 2020 05:00:20 -0500 (EST)
Date:   Thu, 20 Feb 2020 11:00:14 +0100
From:   Greg KH <greg@kroah.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Anthony Mallet <anthony.mallet@laas.fr>, linux-usb@vger.kernel.org
Subject: Re: usb cdc-acm TIOCSSERIAL may wrongly report EPERM
Message-ID: <20200220100014.GA3340412@kroah.com>
References: <24140.5498.228141.264272@beetle.laas.fr>
 <1582106185.9787.9.camel@suse.com>
 <24141.6739.313167.448875@beetle.laas.fr>
 <1582192003.6843.7.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582192003.6843.7.camel@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 20, 2020 at 10:46:43AM +0100, Oliver Neukum wrote:
> 

empty message???
