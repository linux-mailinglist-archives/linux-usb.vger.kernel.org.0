Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9325B48DA98
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 16:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236067AbiAMPUS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 10:20:18 -0500
Received: from netrider.rowland.org ([192.131.102.5]:37963 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236053AbiAMPUS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 10:20:18 -0500
Received: (qmail 265338 invoked by uid 1000); 13 Jan 2022 10:20:16 -0500
Date:   Thu, 13 Jan 2022 10:20:16 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jack Pham <quic_jackp@quicinc.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>,
        linux-usb@vger.kernel.org, Roger Quadros <roger.quadros@nokia.com>
Subject: Re: [PATCH v2] usb: gadget: f_mass_storage: Make CD-ROM emulation
 work with Mac OS-X
Message-ID: <YeBDMDfghatTGrI8@rowland.harvard.edu>
References: <20220110062359.5314-2-quic_jackp@quicinc.com>
 <20220110063030.12957-1-quic_jackp@quicinc.com>
 <Yd80j0vjR0f9TCtN@rowland.harvard.edu>
 <20220113052253.GF3221@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113052253.GF3221@jackp-linux.qualcomm.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 12, 2022 at 09:22:53PM -0800, Jack Pham wrote:
> Hi Alan,
> 
> On Wed, Jan 12, 2022 at 03:05:35PM -0500, Alan Stern wrote:
> > On Sun, Jan 09, 2022 at 10:30:30PM -0800, Jack Pham wrote:
> > > From: Roger Quadros <roger.quadros@nokia.com>
> > > 
> > > Mac OS-X expects CD-ROM TOC in raw format (i.e. format:2). It also
> > > sends the READ_TOC CDB in old style SFF8020i format. i.e. 2 format bits
> > > are encoded in MSBs of CDB byte 9.
> > > 
> > > This patch will enable CD-ROM emulation to work with Mac OS-X. Tested on
> > > Mac OS X v10.6.3.
> > > 
> > > Signed-off-by: Roger Quadros <roger.quadros@nokia.com>
> > > Signed-off-by: Jack Pham <quic_jackp@quicinc.com>
> > > ---
> > > v2: Removed Change-Id tag.
> > > 
> > >  drivers/usb/gadget/function/f_mass_storage.c | 73 +++++++++++++++++++++++-----
> > >  1 file changed, 61 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> > > index 73a28f8..1f7f4dd6 100644
> > > --- a/drivers/usb/gadget/function/f_mass_storage.c
> > > +++ b/drivers/usb/gadget/function/f_mass_storage.c
> > > @@ -1188,6 +1188,8 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
> > >  	int		msf = common->cmnd[1] & 0x02;
> > >  	int		start_track = common->cmnd[6];
> > >  	u8		*buf = (u8 *)bh->buf;
> > > +	u8		format;
> > > +	int		i, len;
> > >  
> > >  	if ((common->cmnd[1] & ~0x02) != 0 ||	/* Mask away MSF */
> > >  			start_track > 1) {
> > > @@ -1195,18 +1197,65 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > -	memset(buf, 0, 20);
> > > -	buf[1] = (20-2);		/* TOC data length */
> > > -	buf[2] = 1;			/* First track number */
> > > -	buf[3] = 1;			/* Last track number */
> > > -	buf[5] = 0x16;			/* Data track, copying allowed */
> > > -	buf[6] = 0x01;			/* Only track is number 1 */
> > > -	store_cdrom_address(&buf[8], msf, 0);
> > > +	format = common->cmnd[2] & 0xf;
> > 
> > Hmmm.  According to this part later on:
> > 
> > > @@ -1933,7 +1982,7 @@ static int do_scsi_command(struct fsg_common *common)
> > >  		common->data_size_from_cmnd =
> > >  			get_unaligned_be16(&common->cmnd[7]);
> > >  		reply = check_command(common, 10, DATA_DIR_TO_HOST,
> > > -				      (7<<6) | (1<<1), 1,
> > > +				      (0xf<<6) | (1<<1), 1,
> > >  				      "READ TOC");
> > 
> > common->cmnd[2] can never be anything other than 0.
> 
> Ah, that is true.  So to allow for cmnd[2] (as well as cmnd[9] as
> intended by the patch) to be non-zero, the "mask" argument should rather
> be:
> 
>  (0xf<<6) | (3<<1)

Indeed.

> In other words a bitmask of 0x3c6, corresponding to command data bytes
> 1, 2, 6, 7, 8 and 9.  Is my understanding correct?

Yes, that's right.

> > So this computation and the test immediately below are pointless --
> > unless you change the argument to check_command().
> 
> If you are referring to the "if (format == 0)" check, then I believe you
> are right.
> 
> > > +	/*
> > > +	 * Check if CDB is old style SFF-8020i
> > > +	 * i.e. format is in 2 MSBs of byte 9
> > > +	 * Mac OS-X host sends us this.
> > > +	 */
> > > +	if (format == 0)
> > > +		format = (common->cmnd[9] >> 6) & 0x3;
> 
> It seems this is the gist of the patch.  Without changing the mask
> parameter to check_command() above, we know we can only reach here if
> format = common->cmnd[2] is 0.  However this snippet is then reassigning
> format from the upper bits of the 9th byte which could be non-zero, at
> least in the case of MacOS.
> 
> So this patch does seem a bit incomplete as you point out and maybe
> updating the mask as above should help to allow both fields to determine
> the format for any non-zero TOC type.
> 
> But I was trying to confirm these details from the SFF-8020i spec as
> mentioned in the original comment above.  I was only able to find a
> draft copy [1] from a web search which stated:
> 
> 	"Format field definition: When Format in Byte 2 is zero, then
> 	Byte 9 is used. Other values for this field are reserved for
> 	definition in MMC."
> 
> 	Note: The Format field in Byte 9 is a vendor-specific area and
> 	will be removed in subsequent versions of this specification.
> 	Functionality is moving to Byte 2."
> 
> However when trying to look up the latest official release of SFF-8020
> the SNIA website [2] lists it as having been expired and incorporated
> into the SCSI MMC specification.  Consequently, I haven't yet been able
> to look further into the SCSI MMC spec itself as it seems it is only
> available for a fee from the ANSI/INCITS website [3].  I'm hoping you or
> maybe somebody on this list might have more knowledge on these details.

I thought I had a copy of the old SFF8020i spec somewhere, but now I 
can't find it.  :-(

> So I'm left wondering whether the Format field in Byte 9 is even
> standardized, or if it is a remnant of an older or possibly
> draft/non-final specification.  Yet we clearly have a host that is
> relying on this behavior, so there is utility in this patch.
> 
> FWIW, here are the raw bytes of the READ TOC request transaction as
> issued by the MacOS host, obtained from a bus analyzer trace, which this
> patch is purportedly fixing:
> 
>  55 53 42 43 19 00 00 00 FE FF 00 00 80 00 0A 43
>                                               ^^
>                                               cmnd[0] i.e. OpCode
>  02 00 00 00 00 00 FF FE 80 00 00 00 00 00 00
>     ^^                   ^^
>     cmnd[2]==0           ||
>                          cmnd[9], upper 2 bits == 0x2

Well, there are really just two things we need to worry about:

	The driver must continue to work properly on all the systems
	that are using it now.

	The driver should be able to work with Mac OS-X.

I think if you simply change the mask value then we'll be okay.

Alan Stern

> Thanks,
> Jack
> 
> [1] https://www.bswd.com/sff8020i.pdf
> [2] https://www.snia.org/technology-communities/sff/specifications
> [3] https://webstore.ansi.org/standards/incits/ansiincits4302007
