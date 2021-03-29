Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5213E34D8D2
	for <lists+linux-usb@lfdr.de>; Mon, 29 Mar 2021 22:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhC2UHK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Mar 2021 16:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbhC2UG7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Mar 2021 16:06:59 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4A8C061756
        for <linux-usb@vger.kernel.org>; Mon, 29 Mar 2021 13:06:59 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 31-20020a9d00220000b02901b64b9b50b1so13448357ota.9
        for <linux-usb@vger.kernel.org>; Mon, 29 Mar 2021 13:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yT8ocahgrDuoXT6m6ETfzQhZyvvH0xJy+cBNqyLrYo8=;
        b=IznSHSPEbbGB54n18iKokmQ7KBlBaynvJqqZDJHMU4oLtmK5ATb8A6GDxOzXttdPc0
         32UhPFrUKrfE6itN1XpQYLq0QlOkbYG2UPYVAn9AmVHbxW64YEAgYtts/Etb9pWvdv/w
         wZr1NoJ3tSviI0J+hXIpliiTJgKdCbpCznpwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yT8ocahgrDuoXT6m6ETfzQhZyvvH0xJy+cBNqyLrYo8=;
        b=l2H0h397nGuhBRh8KjuhzIEiDZy9Rzm2q5JznQTBW9x66h04WDMgkmE/lywfdZS0gT
         xgXhkcHex5r2f2Lgt7ZYs5hWO4hab3k6ZlPpr0wgRouxqOOQAj8QqY/yhOctjkiDdZNs
         REy5neXeqVfCL3Mvptah2Gjn8hqguWePclTVElZYMxUWT1AXaTPw/zD8lwDbwkbZNQ85
         /vml82sYayi29E/ItWtiofodNVoFz1AAYBKgF2vAu2veOwj4QyKt5rheJ4SqvKP85qQc
         ej9lV9DJmCa2PidtjGvW0/BS27g5we/TWgZj0+3OOdB+YivxBn768+hv35sgyIx5aMVb
         we1w==
X-Gm-Message-State: AOAM533ctbwBrPvNzaB7uTQbCZrORZ+o909/HS4dx3wei8wkTpCMxo0O
        0Lff4OBDkgb/kzSdFJjX8jwKNJTrV5ylUg==
X-Google-Smtp-Source: ABdhPJyb+FpQ8cVjJa/HcbIAReZlscNgecYPQPAM2jAUAFg2/eVKyYy/ltRHMtzq29jqrhtTcGHA/A==
X-Received: by 2002:a05:6830:908:: with SMTP id v8mr24667169ott.217.1617048418584;
        Mon, 29 Mar 2021 13:06:58 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id 24sm3612863oij.58.2021.03.29.13.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 13:06:58 -0700 (PDT)
Subject: Re: [PATCH v5] docs: usbip: Fix major fields and descriptions in
 protocol
To:     "Hongren Zheng (Zenithal)" <i@zenithal.me>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?TcOhcnRvbiBOw6ltZXRo?= <nm127@freemail.hu>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Alexandre Demers <alexandre.f.demers@gmail.com>,
        linux-usb@vger.kernel.org, usbip-devel@lists.sourceforge.net,
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <YFAXGBSxaZJ8Dy3/@Sun>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <51edf4bb-1b00-a3b8-4277-25c282588858@linuxfoundation.org>
Date:   Mon, 29 Mar 2021 14:06:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFAXGBSxaZJ8Dy3/@Sun>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/15/21 8:25 PM, Hongren Zheng (Zenithal) wrote:
> The old document for usbip protocol is misleading and hard to read:
>    * Some fields in header are incorrect
>    * Explanation of some fields are unclear or even wrong
>    * Padding of header (namely all headers have the same length) is
>      not explicitly pointed out, which is crucial for stream protocol
>      like TCP
> 
> Major changes:
>    * Document the correct field as described in the codebase.
>    * Document the padding in usbip headers. This is crucial for TCP
>      stream hence these padding should be explicitly point out.
>      In code these padding are implemented by a union of all headers.
>    * Fix two FIXME related to usbip unlink and Document the behavior
>      of unlink in different situation.
>    * Clarify some field with more accurate explanation, like those
>      fields associated with URB. Some constraints are extracted from
>      code.
>    * Delete specific transfer_flag doc in usbip as it should be
>      documented by the URB part.

Why are we deleting this. What do you mean documented by URB part?

>    * Add data captured from wire as example
> 
> Co-developed-by: Alexandre Demers <alexandre.f.demers@gmail.com>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Hongren Zheng <i@zenithal.me>
> ---
>   Documentation/usb/usbip_protocol.rst | 320 ++++++++++++++-------------
>   1 file changed, 171 insertions(+), 149 deletions(-)
> 
> PATCH v2:
> Some changes suggested by a previous patch in
> https://lore.kernel.org/linux-usb
> /20180128071514.9107-1-alexandre.f.demers@gmail.com/
> is adopted in this patch.
>    * Fix Typo: duplicated 'the' in 'the following 4 field'
>    * Fix incorrect field: in OP_REQ_DEVLIST, the second dev starts with
>      field 'path', not 'busid'
> 
> PATCH v3:
> Suggested by
> https://lore.kernel.org/linux-doc/YE8Oan2BmSuKR4%2Fp@kroah.com/
>    * Remove date and changelog in doc as these are tracked in git history
>    * Remove 'mistake alert' as all data fields are documented properly
>      now. However, docs on possible values for some field shall be added
>      in the future
> 
> PATCH v4:
> Suggested by https://lore.kernel.org/linux-doc
> /40351ed6-2907-3966-e69a-a564173b3682@infradead.org/
>    * Add punctuations for readability
>    * Move patch changelog after the marker line
>    * Remove nickname in signed-off-by line
> 
> PATCH v5:
>    * Instead of co-developed-by, use reviewed-by
>      for Randy Dunlap
> 
> diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
> index 988c832166cd..54c5677adf4e 100644
> --- a/Documentation/usb/usbip_protocol.rst
> +++ b/Documentation/usb/usbip_protocol.rst
> @@ -2,11 +2,11 @@
>   USB/IP protocol
>   ===============
>    > -PRELIMINARY DRAFT, MAY CONTAIN MISTAKES> -28 Jun 2011
> +Architecture

Let's add doc version preserving the history.
Add Version 1 and date perhaps.

> +============
>   
>   The USB/IP protocol follows a server/client architecture. The server exports the
> -USB devices and the clients imports them. The device driver for the exported
> +USB devices and the client imports them. The device driver for the exported

clients import them.

>   USB device runs on the client machine.
>   
>   The client may ask for the list of the exported USB devices. To get the list the
> @@ -37,6 +37,9 @@ to transfer the URB traffic between the client and the server. The client may
>   send two types of packets: the USBIP_CMD_SUBMIT to submit an URB, and
>   USBIP_CMD_UNLINK to unlink a previously submitted URB. The answers of the
>   server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
> +Note that after successful USBIP_RET_UNLINK, the unlinked URB request would not
> +have a corresponding USBIP_RET_UNLINK (this is explained in
> +drivers/usb/usbip/stub_rx.c).

This is not clear to me. Doesn't look correct. Where do you see this
in drivers/usb/usbip/stub_rx.c?

>   
>   ::
>   
> @@ -85,16 +88,42 @@ server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
>             |                        .                        |
>             |                        :                        |
>             |                                                 |
> +          |            USBIP_CMD_SUBMIT(seqnum = p)         |
> +          | ----------------------------------------------> |
> +          |                                                 |
> +          |               USBIP_CMD_UNLINK                  |
> +          |         (seqnum = p+1, unlink_seqnum = p)       |
> +          | ----------------------------------------------> |
> +          |                                                 |
> +          |               USBIP_RET_UNLINK                  |
> +          |        (seqnum = p+1, status = -ECONNRESET)     |
> +          | <---------------------------------------------- |
> +          |                                                 |
> +          |         Note: No USBIP_RET_SUBMIT(seqnum = p)   |
> +          | <--X---X---X---X---X---X---X---X---X---X---X--- |
> +          |                        .                        |
> +          |                        :                        |
> +          |                                                 |
> +          |            USBIP_CMD_SUBMIT(seqnum = q)         |
> +          | ----------------------------------------------> |
> +          |                                                 |
> +          |            USBIP_RET_SUBMIT(seqnum = q)         |
> +          | <---------------------------------------------- |
> +          |                                                 |
>             |               USBIP_CMD_UNLINK                  |
> +          |         (seqnum = q+1, unlink_seqnum = q)       |
>             | ----------------------------------------------> |
>             |                                                 |
>             |               USBIP_RET_UNLINK                  |
> +          |           (seqnum = q+1, status = 0)            |
>             | <---------------------------------------------- |
>             |                                                 |
>   

I would do this differently. Let's add this as an expanded
USBIP_CMD_UNLINK sequence with a separate heading below the
current flow

>   The fields are in network (big endian) byte order meaning that the most significant
>   byte (MSB) is stored at the lowest address.
>   
> +Message Format
> +==============
>   
>   OP_REQ_DEVLIST:
>   	Retrieve the list of exported USB devices.
> @@ -102,7 +131,7 @@ OP_REQ_DEVLIST:
>   +-----------+--------+------------+---------------------------------------------------+
>   | Offset    | Length | Value      | Description                                       |
>   +===========+========+============+===================================================+
> -| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0 |
> +| 0         | 2      | 0x0111     | Binary-coded decimal USBIP version number: v1.1.1 |
>   +-----------+--------+------------+---------------------------------------------------+

Let's make this vx.x.x and specify current version number at the top.
Saves us doc updates as we change version number - one location change
as opposed to the entire document
>   | 2         | 2      | 0x8005     | Command code: Retrieve the list of exported USB   |
>   |           |        |            | devices.                                          |
> @@ -116,7 +145,7 @@ OP_REP_DEVLIST:
>   +-----------+--------+------------+---------------------------------------------------+
>   | Offset    | Length | Value      | Description                                       |
>   +===========+========+============+===================================================+
> -| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0.|
> +| 0         | 2      | 0x0111     | Binary-coded decimal USBIP version number: v1.1.1 |
>   +-----------+--------+------------+---------------------------------------------------+
>   | 2         | 2      | 0x0005     | Reply code: The list of exported USB devices.     |
>   +-----------+--------+------------+---------------------------------------------------+
> @@ -165,8 +194,8 @@ OP_REP_DEVLIST:
>   | 0x143     | 1      |            | bNumInterfaces                                    |
>   +-----------+--------+------------+---------------------------------------------------+
>   | 0x144     |        | m_0        | From now on each interface is described, all      |
> -|           |        |            | together bNumInterfaces times, with the           |
> -|           |        |            | the following 4 fields:                           |
> +|           |        |            | together bNumInterfaces times, with the following |
> +|           |        |            | 4 fields:                                         |
>   +-----------+--------+------------+---------------------------------------------------+
>   |           | 1      |            | bInterfaceClass                                   |
>   +-----------+--------+------------+---------------------------------------------------+
> @@ -177,7 +206,7 @@ OP_REP_DEVLIST:
>   | 0x147     | 1      |            | padding byte for alignment, shall be set to zero  |
>   +-----------+--------+------------+---------------------------------------------------+
>   | 0xC +     |        |            | The second exported USB device starts at i=1      |
> -| i*0x138 + |        |            | with the busid field.                             |
> +| i*0x138 + |        |            | with the path field.                              |
>   | m_(i-1)*4 |        |            |                                                   |
>   +-----------+--------+------------+---------------------------------------------------+
>   
> @@ -187,7 +216,7 @@ OP_REQ_IMPORT:
>   +-----------+--------+------------+---------------------------------------------------+
>   | Offset    | Length | Value      | Description                                       |
>   +===========+========+============+===================================================+
> -| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0 |
> +| 0         | 2      | 0x0111     | Binary-coded decimal USBIP version number: v1.1.1 |
>   +-----------+--------+------------+---------------------------------------------------+
>   | 2         | 2      | 0x8003     | Command code: import a remote USB device.         |
>   +-----------+--------+------------+---------------------------------------------------+
> @@ -206,7 +235,7 @@ OP_REP_IMPORT:
>   +-----------+--------+------------+---------------------------------------------------+
>   | Offset    | Length | Value      | Description                                       |
>   +===========+========+============+===================================================+
> -| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0 |
> +| 0         | 2      | 0x0111     | Binary-coded decimal USBIP version number: v1.1.1 |
>   +-----------+--------+------------+---------------------------------------------------+
>   | 2         | 2      | 0x0003     | Reply code: Reply to import.                      |
>   +-----------+--------+------------+---------------------------------------------------+
> @@ -254,158 +283,151 @@ OP_REP_IMPORT:
>   | 0x13E     | 1      |            | bNumInterfaces                                    |
>   +-----------+--------+------------+---------------------------------------------------+
>   
> -USBIP_CMD_SUBMIT:
> -	Submit an URB
> +The following four commands have a common basic header called
> +'usbip_header_basic', and their headers, called 'usbip_header' (before URB
> +payload), have the same length, therefore paddings are needed.
>   
> -+-----------+--------+------------+---------------------------------------------------+
> -| Offset    | Length | Value      | Description                                       |
> -+===========+========+============+===================================================+
> -| 0         | 4      | 0x00000001 | command: Submit an URB                            |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 4         | 4      |            | seqnum: the sequence number of the URB to submit  |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 8         | 4      |            | devid                                             |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0xC       | 4      |            | direction:                                        |
> -|           |        |            |                                                   |
> -|           |        |            |    - 0: USBIP_DIR_OUT                             |
> -|           |        |            |    - 1: USBIP_DIR_IN                              |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x10      | 4      |            | ep: endpoint number, possible values are: 0...15  |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x14      | 4      |            | transfer_flags: possible values depend on the     |
> -|           |        |            | URB transfer type, see below                      |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x18      | 4      |            | transfer_buffer_length                            |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x1C      | 4      |            | start_frame: specify the selected frame to        |
> -|           |        |            | transmit an ISO frame, ignored if URB_ISO_ASAP    |
> -|           |        |            | is specified at transfer_flags                    |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x20      | 4      |            | number_of_packets: number of ISO packets          |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x24      | 4      |            | interval: maximum time for the request on the     |
> -|           |        |            | server-side host controller                       |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x28      | 8      |            | setup: data bytes for USB setup, filled with      |
> -|           |        |            | zeros if not used                                 |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x30      |        |            | URB data. For ISO transfers the padding between   |
> -|           |        |            | each ISO packets is not transmitted.              |
> -+-----------+--------+------------+---------------------------------------------------+
> +usbip_header_basic:
>   
> ++-----------+--------+---------------------------------------------------+
> +| Offset    | Length | Description                                       |
> ++===========+========+===================================================+
> +| 0         | 4      | command                                           |
> ++-----------+--------+---------------------------------------------------+
> +| 4         | 4      | seqnum: sequential number that identifies requests|
> +|           |        | and corresponding responses;                      |
> +|           |        | incremented per connection                        |
> ++-----------+--------+---------------------------------------------------+
> +| 8         | 4      | devid: specifies a remote USB device uniquely     |
> +|           |        | instead of busnum and devnum;                     |
> +|           |        | for client (request), this value is               |
> +|           |        | ((busnum << 16) | devnum);                        |
> +|           |        | for server (response), this shall be set to 0     |
> ++-----------+--------+---------------------------------------------------+
> +| 0xC       | 4      | direction:                                        |
> +|           |        |                                                   |
> +|           |        |    - 0: USBIP_DIR_OUT                             |
> +|           |        |    - 1: USBIP_DIR_IN                              |
> +|           |        |                                                   |
> +|           |        | only used by client, for server this shall be 0   |
> ++-----------+--------+---------------------------------------------------+
> +| 0x10      | 4      | ep: endpoint number                               |
> +|           |        | only used by client, for server this shall be 0;  |
> +|           |        | for UNLINK, this shall be 0                       |
> ++-----------+--------+---------------------------------------------------+
>   
> - +-------------------------+------------+---------+-----------+----------+-------------+
> - | Allowed transfer_flags  | value      | control | interrupt | bulk     | isochronous |
> - +=========================+============+=========+===========+==========+=============+
> - | URB_SHORT_NOT_OK        | 0x00000001 | only in | only in   | only in  | no          |
> - +-------------------------+------------+---------+-----------+----------+-------------+
> - | URB_ISO_ASAP            | 0x00000002 | no      | no        | no       | yes         |
> - +-------------------------+------------+---------+-----------+----------+-------------+
> - | URB_NO_TRANSFER_DMA_MAP | 0x00000004 | yes     | yes       | yes      | yes         |
> - +-------------------------+------------+---------+-----------+----------+-------------+
> - | URB_ZERO_PACKET         | 0x00000040 | no      | no        | only out | no          |
> - +-------------------------+------------+---------+-----------+----------+-------------+
> - | URB_NO_INTERRUPT        | 0x00000080 | yes     | yes       | yes      | yes         |
> - +-------------------------+------------+---------+-----------+----------+-------------+
> - | URB_FREE_BUFFER         | 0x00000100 | yes     | yes       | yes      | yes         |
> - +-------------------------+------------+---------+-----------+----------+-------------+
> - | URB_DIR_MASK            | 0x00000200 | yes     | yes       | yes      | yes         |
> - +-------------------------+------------+---------+-----------+----------+-------------+
> +USBIP_CMD_SUBMIT:
> +	Submit an URB
>   
> ++-----------+--------+---------------------------------------------------+
> +| Offset    | Length | Description                                       |
> ++===========+========+===================================================+
> +| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000001 |
> ++-----------+--------+---------------------------------------------------+
> +| 0x14      | 4      | transfer_flags: possible values depend on the     |
> +|           |        | URB transfer_flags,                               |
> +|           |        | but with URB_NO_TRANSFER_DMA_MAP masked           |
> ++-----------+--------+---------------------------------------------------+
> +| 0x18      | 4      | transfer_buffer_length:                           |
> +|           |        | use URB transfer_buffer_length                    |
> ++-----------+--------+---------------------------------------------------+
> +| 0x1C      | 4      | start_frame: use URB start_frame;                 |
> +|           |        | initial frame for ISO transfer;                   |
> +|           |        | shall be set to 0 if not ISO transfer             |
> ++-----------+--------+---------------------------------------------------+
> +| 0x20      | 4      | number_of_packets: number of ISO packets;         |
> +|           |        | shall be set to 0xffffffff if not ISO transfer    |
> ++-----------+--------+---------------------------------------------------+
> +| 0x24      | 4      | interval: maximum time for the request on the     |
> +|           |        | server-side host controller                       |
> ++-----------+--------+---------------------------------------------------+
> +| 0x28      | 8      | setup: data bytes for USB setup, filled with      |
> +|           |        | zeros if not used.                                |
> ++-----------+--------+---------------------------------------------------+
> +| 0x30      | n      | transfer_buffer.                                  |
> +|           |        | If direction is USBIP_DIR_OUT then n equals       |
> +|           |        | transfer_buffer_length; otherwise n equals 0.     |
> +|           |        | For ISO transfers the padding between each ISO    |
> +|           |        | packets is not transmitted.                       |
> ++-----------+--------+---------------------------------------------------+
> +| 0x30+n    | m      | iso_packet_descriptor                             |
> ++-----------+--------+---------------------------------------------------+
>   
>   USBIP_RET_SUBMIT:
>   	Reply for submitting an URB
>   
> -+-----------+--------+------------+---------------------------------------------------+
> -| Offset    | Length | Value      | Description                                       |
> -+===========+========+============+===================================================+
> -| 0         | 4      | 0x00000003 | command                                           |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 4         | 4      |            | seqnum: URB sequence number                       |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 8         | 4      |            | devid                                             |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0xC       | 4      |            | direction:                                        |
> -|           |        |            |                                                   |
> -|           |        |            |    - 0: USBIP_DIR_OUT                             |
> -|           |        |            |    - 1: USBIP_DIR_IN                              |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x10      | 4      |            | ep: endpoint number                               |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x14      | 4      |            | status: zero for successful URB transaction,      |
> -|           |        |            | otherwise some kind of error happened.            |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x18      | 4      | n          | actual_length: number of URB data bytes           |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x1C      | 4      |            | start_frame: for an ISO frame the actually        |
> -|           |        |            | selected frame for transmit.                      |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x20      | 4      |            | number_of_packets                                 |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x24      | 4      |            | error_count                                       |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x28      | 8      |            | setup: data bytes for USB setup, filled with      |
> -|           |        |            | zeros if not used                                 |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x30      | n      |            | URB data bytes. For ISO transfers the padding     |
> -|           |        |            | between each ISO packets is not transmitted.      |
> -+-----------+--------+------------+---------------------------------------------------+
> ++-----------+--------+---------------------------------------------------+
> +| Offset    | Length | Description                                       |
> ++===========+========+===================================================+
> +| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000003 |
> ++-----------+--------+---------------------------------------------------+
> +| 0x14      | 4      | status: zero for successful URB transaction,      |
> +|           |        | otherwise some kind of error happened.            |
> ++-----------+--------+---------------------------------------------------+
> +| 0x18      | 4      | actual_length: number of URB data bytes;          |
> +|           |        | use URB actual_length                             |
> ++-----------+--------+---------------------------------------------------+
> +| 0x1C      | 4      | start_frame: use URB start_frame;                 |
> +|           |        | initial frame for ISO transfer;                   |
> +|           |        | shall be set to 0 if not ISO transfer             |
> ++-----------+--------+---------------------------------------------------+
> +| 0x20      | 4      | number_of_packets: number of ISO packets;         |
> +|           |        | shall be set to 0xffffffff if not ISO transfer    |
> ++-----------+--------+---------------------------------------------------+
> +| 0x24      | 4      | error_count                                       |
> ++-----------+--------+---------------------------------------------------+
> +| 0x28      | 8      | padding, shall be set to 0                        |
> ++-----------+--------+---------------------------------------------------+
> +| 0x30      | n      | transfer_buffer.                                  |
> +|           |        | If direction is USBIP_DIR_IN then n equals        |
> +|           |        | actual_length; otherwise n equals 0.              |
> +|           |        | For ISO transfers the padding between each ISO    |
> +|           |        | packets is not transmitted.                       |
> ++-----------+--------+---------------------------------------------------+
> +| 0x30+n    | m      | iso_packet_descriptor                             |
> ++-----------+--------+---------------------------------------------------+
>   
>   USBIP_CMD_UNLINK:
>   	Unlink an URB
>   
> -+-----------+--------+------------+---------------------------------------------------+
> -| Offset    | Length | Value      | Description                                       |
> -+===========+========+============+===================================================+
> -| 0         | 4      | 0x00000002 | command: URB unlink command                       |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 4         | 4      |            | seqnum: URB sequence number to unlink:            |
> -|           |        |            |                                                   |
> -|           |        |            | FIXME:                                            |
> -|           |        |            |    is this so?                                    |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 8         | 4      |            | devid                                             |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0xC       | 4      |            | direction:                                        |
> -|           |        |            |                                                   |
> -|           |        |            |    - 0: USBIP_DIR_OUT                             |
> -|           |        |            |    - 1: USBIP_DIR_IN                              |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x10      | 4      |            | ep: endpoint number: zero                         |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x14      | 4      |            | seqnum: the URB sequence number given previously  |
> -|           |        |            | at USBIP_CMD_SUBMIT.seqnum field                  |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x30      | n      |            | URB data bytes. For ISO transfers the padding     |
> -|           |        |            | between each ISO packets is not transmitted.      |
> -+-----------+--------+------------+---------------------------------------------------+
> ++-----------+--------+---------------------------------------------------+
> +| Offset    | Length | Description                                       |
> ++===========+========+===================================================+
> +| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000002 |
> ++-----------+--------+---------------------------------------------------+
> +| 0x14      | 4      | unlink_seqnum, of the SUBMIT request to unlink    |
> ++-----------+--------+---------------------------------------------------+
> +| 0x18      | 24     | padding, shall be set to 0                        |
> ++-----------+--------+---------------------------------------------------+
>   
>   USBIP_RET_UNLINK:
>   	Reply for URB unlink
>   
> -+-----------+--------+------------+---------------------------------------------------+
> -| Offset    | Length | Value      | Description                                       |
> -+===========+========+============+===================================================+
> -| 0         | 4      | 0x00000004 | command: reply for the URB unlink command         |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 4         | 4      |            | seqnum: the unlinked URB sequence number          |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 8         | 4      |            | devid                                             |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0xC       | 4      |            | direction:                                        |
> -|           |        |            |                                                   |
> -|           |        |            |    - 0: USBIP_DIR_OUT                             |
> -|           |        |            |    - 1: USBIP_DIR_IN                              |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x10      | 4      |            | ep: endpoint number                               |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x14      | 4      |            | status: This is the value contained in the        |
> -|           |        |            | urb->status in the URB completition handler.      |
> -|           |        |            |                                                   |
> -|           |        |            | FIXME:                                            |
> -|           |        |            |      a better explanation needed.                 |
> -+-----------+--------+------------+---------------------------------------------------+
> -| 0x30      | n      |            | URB data bytes. For ISO transfers the padding     |
> -|           |        |            | between each ISO packets is not transmitted.      |
> -+-----------+--------+------------+---------------------------------------------------+
> ++-----------+--------+---------------------------------------------------+
> +| Offset    | Length | Description                                       |
> ++===========+========+===================================================+
> +| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000004 |
> ++-----------+--------+---------------------------------------------------+
> +| 0x14      | 4      | status: This is similar to the status of          |
> +|           |        | USBIP_RET_SUBMIT (share the same memory offset).  |
> +|           |        | When UNLINK is successful, status is -ECONNRESET; |
> +|           |        | when USBIP_CMD_UNLINK is after USBIP_RET_SUBMIT   |
> +|           |        | status is 0                                       |
> ++-----------+--------+---------------------------------------------------+
> +| 0x18      | 24     | padding, shall be set to 0                        |
> ++-----------+--------+---------------------------------------------------+
> +
> +EXAMPLE
> +=======
> +
> +  The following data is captured from wire with Human Interface Devices (HID)
> +  payload
> +
> +::
> +
> +  CmdIntrIN:  00000001 00000d05 0001000f 00000001 00000001 00000200 00000040 ffffffff 00000000 00000004 00000000 00000000
> +  CmdIntrOUT: 00000001 00000d06 0001000f 00000000 00000001 00000000 00000040 ffffffff 00000000 00000004 00000000 00000000
> +              ffffffff860008a784ce5ae212376300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
> +  RetIntrOut: 00000003 00000d06 00000000 00000000 00000000 00000000 00000040 ffffffff 00000000 00000000 00000000 00000000
> +  RetIntrIn:  00000003 00000d05 00000000 00000000 00000000 00000000 00000040 ffffffff 00000000 00000000 00000000 00000000
> +              ffffffff860011a784ce5ae2123763612891b1020100000400000000000000000000000000000000000000000000000000000000000000000000000000000000
> 

