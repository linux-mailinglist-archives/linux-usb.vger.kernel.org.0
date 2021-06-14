Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2944F3A6B45
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jun 2021 18:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234419AbhFNQJg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 12:09:36 -0400
Received: from mga11.intel.com ([192.55.52.93]:31270 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233640AbhFNQJf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Jun 2021 12:09:35 -0400
IronPort-SDR: EZNnWDNdqhlmLDexTTXwTt64VRA74atiTY4vVaPPc1s8zKjQ3/s/pNi0GgSHoY0O1CfHijOIG3
 +BqwE6DKYBOw==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="202809728"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; 
   d="scan'208";a="202809728"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2021 09:07:29 -0700
IronPort-SDR: ozv5OR2btG/U0rA5ssXkgharZ66M0u/6eI7VdMfv0pMcQskGPc3YiWZU0dsH8cgEGjFEjiKVgk
 +i9GFSpox5kw==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; 
   d="scan'208";a="415132908"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2021 09:07:26 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 14 Jun 2021 19:07:24 +0300
Date:   Mon, 14 Jun 2021 19:07:24 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg KH <greg@kroah.com>
Cc:     Gil Fine <gil.fine@intel.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH] thunderbolt: Fix DROM handling for USB4 DROM
Message-ID: <YMd+vAL+Lzccj2kK@lahna>
References: <20210614135210.29787-1-gil.fine@intel.com>
 <YMdiZnPKqjyK6FQ5@kroah.com>
 <YMdu1/1sRCItaKrj@lahna>
 <YMdz4qEZbQ/dnloN@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMdz4qEZbQ/dnloN@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 14, 2021 at 05:21:06PM +0200, Greg KH wrote:
> On Mon, Jun 14, 2021 at 05:59:35PM +0300, Mika Westerberg wrote:
> > Hi Greg,
> > 
> > On Mon, Jun 14, 2021 at 04:06:30PM +0200, Greg KH wrote:
> > > On Mon, Jun 14, 2021 at 04:52:10PM +0300, Gil Fine wrote:
> > > > DROM for USB4 host/device has a shorter header than Thunderbolt DROM
> > > > header. This patch addresses host/device with USB4 DROM (According to spec:
> > > > Universal Serial Bus 4 (USB4) Device ROM Specification, Rev 1.0, Feb-2021).
> > > > 
> > > > Signed-off-by: Gil Fine <gil.fine@intel.com>
> > > > ---
> > > >  drivers/thunderbolt/eeprom.c | 19 +++++++++++--------
> > > >  1 file changed, 11 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
> > > > index 46d0906a3070..f9d26bd4f486 100644
> > > > --- a/drivers/thunderbolt/eeprom.c
> > > > +++ b/drivers/thunderbolt/eeprom.c
> > > > @@ -214,7 +214,10 @@ static u32 tb_crc32(void *data, size_t len)
> > > >  	return ~__crc32c_le(~0, data, len);
> > > >  }
> > > >  
> > > > -#define TB_DROM_DATA_START 13
> > > > +#define TB_DROM_DATA_START		13
> > > > +#define TB_DROM_HEADER_LENGTH		22
> > > > +/* BYTES 16-21 - nonexistent in USB4 DROM */
> > > > +#define TB_DROM_USB4_HEADER_LENGTH	16
> > > >  struct tb_drom_header {
> > > >  	/* BYTE 0 */
> > > >  	u8 uid_crc8; /* checksum for uid */
> > > > @@ -224,9 +227,9 @@ struct tb_drom_header {
> > > >  	u32 data_crc32; /* checksum for data_len bytes starting at byte 13 */
> > > >  	/* BYTE 13 */
> > > >  	u8 device_rom_revision; /* should be <= 1 */
> > > > -	u16 data_len:10;
> > > > -	u8 __unknown1:6;
> > > > -	/* BYTES 16-21 */
> > > > +	u16 data_len:12;
> > > > +	u8 reserved:4;
> > > > +	/* BYTES 16-21 - Only for TBT DROM, nonexistent in USB4 DROM */
> > > 
> > > What is the odds the above does not work properly for big endian
> > > systems?
> > 
> > If you mean the bitfields, we have been trying to get rid of them. Any
> > new code is expected not to introduce new structures like this but it
> > has been OK for existing structures (for now).
> 
> Ok, as long as you all realize this is broken :)

Yes we do :) This is one of the things that need to be sorted out once
we have all the "features" in place.
