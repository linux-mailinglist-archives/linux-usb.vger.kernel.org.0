Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052253A69F5
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jun 2021 17:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233435AbhFNPXR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 11:23:17 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:54933 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233222AbhFNPXP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Jun 2021 11:23:15 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 734055807DB;
        Mon, 14 Jun 2021 11:21:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 14 Jun 2021 11:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=l3f3M//GA2R6a07+weQvlk+BlL+
        JArI2S3vr2whtaj8=; b=XRKMV9OUNdx4H2uosQMUeAoenlv3g+1rFOmSDLJ6U69
        WUmKkwwlk4bFpODWhof5lNDiymTxyfqdr/5ebSfQFUQaOlkb23/rej8i5OhEj6NM
        EYavmp0J6WtLJbXl8WrqyJ1gKhHbVX8eowOTjfG+Yq0I74GaXMBkSGqqdRdN29Lx
        uS/LwIoTAwbdHItV/0Pp1rAe3zd6rhIKNaQ5uaeCo6mgoTqtnebYWYZ2VvqxDaiI
        gNChJNjwIGNJSdI5MGE3Zb7g98dS1VEtdYMybeAeFCXjlm8L9Jb3mgN3gPLnpMlI
        YI2yig60z/+yoHDM0RTQF0IUyN0D2hJFL78wiE+Rdwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=l3f3M/
        /GA2R6a07+weQvlk+BlL+JArI2S3vr2whtaj8=; b=XgvLaFp0I1EohOCPYNqpP8
        +FxoJG7XBCOnB4E8k2t3aDEF45QusBIEN0zur8x72WyBaFcSECLHl6UHil5zY/KW
        7K7n3TWpnGL2QjxlPgLxUjod0WIqWNKBNAxBnaQN7amhr6hJ1XIHnv1/Y44Wttpn
        C4EOl+LHxMkNpBXLwEKbkezMYvP1qomLpxQ4v81Zh0XsERzm1j7EXKi4gwSu70oo
        0OJEHvfpMBFfqZA+JyOgsEOTCbOAwF61epbEPgnuN4sOu40ombQif9UtLarUl6DC
        QsKsqHip/m22kmQ3PRdExxVnzZfvT0u1ZiHiGazaGosiRuP88RZGoVclGGXoDbUw
        ==
X-ME-Sender: <xms:5XPHYBmSXwSFflrwEv1Uhtng69yUsghaf0-f25Ihh21vUd78q5kdfg>
    <xme:5XPHYM3G9V6K8S96mhNLCvjlOn4B3e_B_gFkX3bA1TnGEbemD6UWbU6LkRRbSMJlz
    iBLyxfBMCtTbQ>
X-ME-Received: <xmr:5XPHYHornkH4aNj3LwkCVK7I_yThOT_0zbv82l5UAlhvsjwaCpGGA3jMkWQDEB2YXbcbR4931DGlZhg-15Zeo73b70obwHs2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvhedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:5XPHYBmLwzARfLtvCIG9R2NuMemaEuXb7q-CU0UFF-lcegdPlc_BVA>
    <xmx:5XPHYP1zipcieGj66AQ520LYQRJ5nWmvLw6maIHLv81Azw3IP6Dxgg>
    <xmx:5XPHYAtNS74734VzCmmw4DfNPyvLeKdIPr2TU_kIiiwfvT5B46F0Ow>
    <xmx:53PHYNP4i9c8ALKbL64Kb9opz063U0O87WSZoB5fD4aCgVAewqpOEw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jun 2021 11:21:08 -0400 (EDT)
Date:   Mon, 14 Jun 2021 17:21:06 +0200
From:   Greg KH <greg@kroah.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Gil Fine <gil.fine@intel.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH] thunderbolt: Fix DROM handling for USB4 DROM
Message-ID: <YMdz4qEZbQ/dnloN@kroah.com>
References: <20210614135210.29787-1-gil.fine@intel.com>
 <YMdiZnPKqjyK6FQ5@kroah.com>
 <YMdu1/1sRCItaKrj@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMdu1/1sRCItaKrj@lahna>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 14, 2021 at 05:59:35PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> On Mon, Jun 14, 2021 at 04:06:30PM +0200, Greg KH wrote:
> > On Mon, Jun 14, 2021 at 04:52:10PM +0300, Gil Fine wrote:
> > > DROM for USB4 host/device has a shorter header than Thunderbolt DROM
> > > header. This patch addresses host/device with USB4 DROM (According to spec:
> > > Universal Serial Bus 4 (USB4) Device ROM Specification, Rev 1.0, Feb-2021).
> > > 
> > > Signed-off-by: Gil Fine <gil.fine@intel.com>
> > > ---
> > >  drivers/thunderbolt/eeprom.c | 19 +++++++++++--------
> > >  1 file changed, 11 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
> > > index 46d0906a3070..f9d26bd4f486 100644
> > > --- a/drivers/thunderbolt/eeprom.c
> > > +++ b/drivers/thunderbolt/eeprom.c
> > > @@ -214,7 +214,10 @@ static u32 tb_crc32(void *data, size_t len)
> > >  	return ~__crc32c_le(~0, data, len);
> > >  }
> > >  
> > > -#define TB_DROM_DATA_START 13
> > > +#define TB_DROM_DATA_START		13
> > > +#define TB_DROM_HEADER_LENGTH		22
> > > +/* BYTES 16-21 - nonexistent in USB4 DROM */
> > > +#define TB_DROM_USB4_HEADER_LENGTH	16
> > >  struct tb_drom_header {
> > >  	/* BYTE 0 */
> > >  	u8 uid_crc8; /* checksum for uid */
> > > @@ -224,9 +227,9 @@ struct tb_drom_header {
> > >  	u32 data_crc32; /* checksum for data_len bytes starting at byte 13 */
> > >  	/* BYTE 13 */
> > >  	u8 device_rom_revision; /* should be <= 1 */
> > > -	u16 data_len:10;
> > > -	u8 __unknown1:6;
> > > -	/* BYTES 16-21 */
> > > +	u16 data_len:12;
> > > +	u8 reserved:4;
> > > +	/* BYTES 16-21 - Only for TBT DROM, nonexistent in USB4 DROM */
> > 
> > What is the odds the above does not work properly for big endian
> > systems?
> 
> If you mean the bitfields, we have been trying to get rid of them. Any
> new code is expected not to introduce new structures like this but it
> has been OK for existing structures (for now).

Ok, as long as you all realize this is broken :)

> > And why put the comment after the area and not before?
> 
> The gap is there after the "reserved" field.

Ah, I read the patch wrong, sorry, my fault.

greg k-h
