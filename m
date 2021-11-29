Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C90460EF7
	for <lists+linux-usb@lfdr.de>; Mon, 29 Nov 2021 07:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbhK2GxD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Nov 2021 01:53:03 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:45027 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230501AbhK2GvC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Nov 2021 01:51:02 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id DC3B25C007E;
        Mon, 29 Nov 2021 01:47:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 29 Nov 2021 01:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=Z9jR3gvqWtVNJ28wX7yXCdzY9hV
        Oz2F6MjsGbgqnTcQ=; b=RkXQRhRtJlFMH+tsqYUfrHKW+GUl9f33l8hkju1oHpM
        MatfSCJYecG87mthnoMWEKL0BaLNzjqwPT6TihICUYjdjmazFTVb5pxupipOtZXI
        FaRFCKupUGnovT7uxYst5igMN/juZWFb1J1kw5zIE9i68jOIIREtspr8a0TzSmql
        A3gv63z6IGQlSu0DvVax/0NlxpujMzx22TiQfCvIreH93GtjyIB1SveNYw5WaAYu
        OAmsz9sOSXtDtz9OzciZGHeQf+1Nr+IsgVEOOooEDDapBw1zRSA80ZObN67j/DP2
        hhdTPL5iP8JbX/I1i0GeHzYAG9QxZjA7Ab5AuwPCZKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Z9jR3g
        vqWtVNJ28wX7yXCdzY9hVOz2F6MjsGbgqnTcQ=; b=ax+XdnqXhg2CNPi8EBewUO
        3NQo2AHlf/MQW9sXe3+p10aTB3hJsjYdVbjakhxttj5y75BeYOrlwdAvvLEnq+2s
        rDLDQZKvNcDdpv02Vsh5HfEa3+Q2uFMZVW8VDmAbbuatwX2MdAFOyDrXvb4mToEk
        gDQYq7ow/6OMaef53KivdGp5AecFmIU7fy6kn5FYxIPs24tD0ZnMKOvecawF5cia
        aRUzN7yE6gZSJ5OBcEZMer6IxfPB7Tf0AoF94zDJwPCS4eArqvF6CjcoY3b53vxn
        7xQKtX3r/Jr6B/di7JQQaiTk+UVhcAWUmvewyRjOeNhbFAJ7ELIA3NrXkCupeXjA
        ==
X-ME-Sender: <xms:jXekYcEG5H4r92WpXKdc6iI0WepPWKwkw7_TBUjzuNwIoZ6m0MpxPg>
    <xme:jXekYVViCsWgtiwAxkQhEKD9C0UJJZeFl6GyEX2DPd3OiRkSOal-xjBlrBHNrR_va
    pFqiTxTWP3HHQ>
X-ME-Received: <xmr:jXekYWKUgI07EIa-6m3T67Pq9SveGXeSKggP0tk3idzwHuz3EB5xAh6QnBIUi_4N3Yo-e7VcHZwczLw-UUOwwFlL3-07OuSc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:jXekYeGlStBHMwIrfZ-oE-lCHrA7QhuIhiO2t51-goJ5nDv5XKA9zg>
    <xmx:jXekYSWLgAYfA8xuqhXa1NDElCl9--SHC5OJ_yooRY3P_EGBxwg8qg>
    <xmx:jXekYRMZwR7o_GgoWXrCxykncr2Zr4_2UBmoUTS3ZdMtJDWw2boMQw>
    <xmx:jXekYUKe1BrFhhU7WVVhv39UhIra-rPJnMikVZLtOYQgIjq5zeZ6iQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 01:47:41 -0500 (EST)
Date:   Mon, 29 Nov 2021 07:47:38 +0100
From:   Greg KH <greg@kroah.com>
To:     Lars Gunnarsson <gunnarsson.lars@gmail.com>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/5] tools/usbip: update protocol documentation
Message-ID: <YaR3iqQlR9uo6tTo@kroah.com>
References: <20211128211202.GA37076@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211128211202.GA37076@dell-precision-T3610>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Nov 28, 2021 at 10:12:02PM +0100, Lars Gunnarsson wrote:
> This patch contains usbip protocol documentation updates for
> the implementation changes in subsequent patches.
> 
> Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
> ---
> v1: New patch added in series.
> v2: Update paragraph according to review comments
> 
>  Documentation/usb/usbip_protocol.rst | 61 ++++++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
> index 0b8541fda4d8..2d540fcc4b21 100644
> --- a/Documentation/usb/usbip_protocol.rst
> +++ b/Documentation/usb/usbip_protocol.rst
> @@ -9,6 +9,11 @@ The USB/IP protocol follows a server/client architecture. The server exports the
>  USB devices and the clients import them. The device driver for the exported
>  USB device runs on the client machine.
> 
> +The server may choose to export any of its available USB devices based on their
> +busid. These devices will remain exported until they are unplugged or unexported.
> +Optionally, it is possible to persistently export the devices on a given bus by
> +monitor when they are plugged in.
> +
>  The client may ask for the list of the exported USB devices. To get the list the
>  client opens a TCP/IP connection to the server, and sends an OP_REQ_DEVLIST
>  packet on top of the TCP/IP connection (so the actual OP_REQ_DEVLIST may be sent
> @@ -31,12 +36,7 @@ TCP/IP connection is closed.
> 
>  Once the client knows the list of exported USB devices it may decide to use one
>  of them. First the client opens a TCP/IP connection to the server and
> -sends an OP_REQ_IMPORT packet. The server replies with OP_REP_IMPORT. If the
> -import was successful the TCP/IP connection remains open and will be used
> -to transfer the URB traffic between the client and the server. The client may
> -send two types of packets: the USBIP_CMD_SUBMIT to submit an URB, and
> -USBIP_CMD_UNLINK to unlink a previously submitted URB. The answers of the
> -server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
> +sends an OP_REQ_IMPORT packet. The server replies with OP_REP_IMPORT.
> 
>  ::
> 
> @@ -50,6 +50,47 @@ server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
>            |                  OP_REP_IMPORT                  |
>            | <---------------------------------------------- |
>            |                                                 |
> +
> +The client may also request to poll for devices to become exported on a given
> +busid, instead of immediately receive an error. If no device becomes exported
> +within the chosen time, the server replies with timeout. The TCP/IP connection
> +remains open and subsequent poll requests can be sent.
> +
> +::
> +
> + virtual host controller                                 usb host
> +      "client"                                           "server"
> +  (imports USB devices)                             (exports USB devices)
> +          |                                                 |
> +          |                  OP_REQ_IMPORT                  |
> +          | ----------------------------------------------> |
> +          |                        .                        |
> +          |                        :                        |
> +          |                                                 |
> +          |                  OP_REP_IMPORT                  |
> +          | <---------------------------------------------- |
> +          |                                                 |
> +          |                  OP_REQ_IMPORT                  |
> +          | ----------------------------------------------> |
> +          |                        .                        |
> +          |                        :                        |
> +          |                                                 |
> +          |                  OP_REP_IMPORT                  |
> +          | <---------------------------------------------- |
> +          |                        .                        |
> +          |                        :                        |
> +
> +If the import was successful the TCP/IP connection remains open and will be used
> +to transfer the URB traffic between the client and the server. The client may
> +send two types of packets: the USBIP_CMD_SUBMIT to submit an URB, and
> +USBIP_CMD_UNLINK to unlink a previously submitted URB. The answers of the
> +server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
> +
> +::
> +
> + virtual host controller                                 usb host
> +      "client"                                           "server"
> +  (imports USB devices)                             (exports USB devices)
>            |                                                 |
>            |            USBIP_CMD_SUBMIT(seqnum = n)         |
>            | ----------------------------------------------> |
> @@ -132,8 +173,8 @@ byte (MSB) is stored at the lowest address.
>  Protocol Version
>  ================
> 
> -The documented USBIP version is v1.1.1. The binary representation of this
> -version in message headers is 0x0111.
> +The documented USBIP version is v1.1.2. The binary representation of this
> +version in message headers is 0x0112.
> 
>  This is defined in tools/usb/usbip/configure.ac
> 
> @@ -243,6 +284,10 @@ OP_REQ_IMPORT:
>  |           |        |            | A string closed with zero, the unused bytes       |
>  |           |        |            | shall be filled with zeros.                       |
>  +-----------+--------+------------+---------------------------------------------------+
> +| 40        | 4      |            | poll timeout: instead of returning immediately if |
> +|           |        |            | device is not available, wait until usb device    |
> +|           |        |            | becomes exported or a timeout occurs.             |
> ++-----------+--------+------------+---------------------------------------------------+
> 
>  OP_REP_IMPORT:
>  	Reply to import (attach) a remote USB device.
> --
> 2.25.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
