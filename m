Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 370FE1B0766
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2020 13:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgDTL0P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Apr 2020 07:26:15 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56455 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726020AbgDTL0O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Apr 2020 07:26:14 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 190A05C0062;
        Mon, 20 Apr 2020 07:26:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 20 Apr 2020 07:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=eqeCkeeuew1izivNnzRTwZ1I374
        BSEWf2xWBLxnBlF8=; b=c1bxupDyHP/Cmeoh9hNy5+azXwIoHlcpF+3e7u7h28N
        lFspDsTC1BtwzQyYH5Di6cO21r70K4efoe7KLdXHhFz6bw0BsMsnckRupQOegUhO
        c3025/FyGk8K4Lnua6EH9OtYrNq+qKCSmwwWy2IvPZRU6RfBrPIRXiXzR1cyyVoO
        T5mz71LfSc1upeprvzltQb7CaSathYCC9avcxjhDXajRQY06NhygTrArrghro4YW
        N8xPdWEg8lG4zCHtKwalyKNumxKaZ8M+TS8H1ho9/jepBdLahpk2asCIQ/W1gQ50
        H2ttWHugsr8lcjE5Nl/xgpdqz3iMWUwOSMSxBGTyKfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eqeCke
        euew1izivNnzRTwZ1I374BSEWf2xWBLxnBlF8=; b=C27wzkyPobuhD6HEHoaaEh
        dF5EFefGA+69htNzOlcGMMBQ3TZykapIrOD9u9Okdrin2fjt0COMjrvR0yUYKaQP
        XaTMvffn7TtS/fAkeo3cJ6et6+z13dP2zQwcwCEGzNBoyzqa4GUTxtQKup7LE5qt
        ayuHqKiuBpVuuf53aSuReAW/tOLdmwxovGPATylvlFXde/TxLhshGHl5d5kY2WXL
        wX64spRrhQOuphF4dJPP5kkplnzRIE+Y4KqmYemLKwgS9L0IBysJT1Cx5k1REHNT
        Vk+liI2YnmHULEMo6rCR8a+cjlEQTq5ovgdmSfqRJKdb5vzBUUtKLDJYmMbiQgow
        ==
X-ME-Sender: <xms:1YadXraDRL6XOagMwoxHRN5W_ifYrvZQ7-R4q1TrAmmLLKL8ex-hwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeefgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledruddtje
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgv
    gheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:1YadXre5rMI8xb2QAAsjzlkWzceEQofv24rvhxctBjbUeuIfLZ9o_w>
    <xmx:1YadXlea3Woywh1pdrIT2pDRhXL0i1ondcCo8OnAgHt6T7AgngI9Bw>
    <xmx:1YadXv6-JmqnGAcE6PaEzTa24HGdBmuT_vtgbhIaSIp1O0Ruh8TFBg>
    <xmx:1oadXowskRUOSJAUO6CcYL7vHdy8ikMJBW5PWd24YdzUBfSUmlC2dg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5F0A3328005E;
        Mon, 20 Apr 2020 07:26:13 -0400 (EDT)
Date:   Mon, 20 Apr 2020 13:26:11 +0200
From:   Greg KH <greg@kroah.com>
To:     Changming Liu <liu.changm@northeastern.edu>
Cc:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Lu, Long" <l.lu@northeastern.edu>,
        "yaohway@gmail.com" <yaohway@gmail.com>
Subject: Re: [Bug Report] drivers/usb/misc/sisusbvga: integer overflow in
 sisusb_getidxreg and others
Message-ID: <20200420112611.GA3863657@kroah.com>
References: <BL0PR06MB4548529DBAEA7075BAE4289EE5D70@BL0PR06MB4548.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR06MB4548529DBAEA7075BAE4289EE5D70@BL0PR06MB4548.namprd06.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Apr 19, 2020 at 10:04:06PM +0000, Changming Liu wrote:
> Hi Thomas,
> Greetings, I'm a first-year PhD student who is interested in using UBSan for linux kernel. With some experiments, I found that in
> drivers/usb/misc/sisusbvga/sisusb.c sisusb_getidxreg, there is an signed integer overflow which might cause unexpected result.
> 
> More specifically, starting from the fetch function in func sisusb_ioctl, line 2959, struct sisusb_command y is filled with data from user space. Then diving into 
> sisusb_handle_command, the signed integer, named port, is casted from y->data3.
> Then when executing sisusb_getidxreg, the signed integer, port, is used as 32-bit unsigned address in function sisusb_write_memio_byte.

Great, can you provide a patch fixing this so we can give you the proper
credit for finding and fixing the issue?

thanks,

greg k-h
