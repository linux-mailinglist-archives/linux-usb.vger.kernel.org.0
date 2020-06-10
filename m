Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A711F56D4
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jun 2020 16:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729859AbgFJObB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Jun 2020 10:31:01 -0400
Received: from netrider.rowland.org ([192.131.102.5]:48875 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729811AbgFJObB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Jun 2020 10:31:01 -0400
Received: (qmail 14031 invoked by uid 1000); 10 Jun 2020 10:31:00 -0400
Date:   Wed, 10 Jun 2020 10:31:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Macpaul Lin <macpaul.lin@mediatek.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bart Van Assche <bvanassche@acm.org>,
        EJ Hsu <ejh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
        Macpaul Lin <macpaul.lin@gmail.com>,
        Justin Hsieh <justinhsieh@google.com>,
        Hakieyin Hsieh <hakieyin@gmail.com>
Subject: Re: [PATCH v2] usb/gadget/function: introduce Built-in CDROM support
Message-ID: <20200610143100.GB11727@rowland.harvard.edu>
References: <1591756349-17865-1-git-send-email-macpaul.lin@mediatek.com>
 <1591769718-3287-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591769718-3287-1-git-send-email-macpaul.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 10, 2020 at 02:15:18PM +0800, Macpaul Lin wrote:
> Introduce Built-In CDROM (BICR) support.
> This feature depends on USB_CONFIGFS_MASS_STORAGE option.
> 
> 1. Some settings and new function is introduced for BICR.
> 2. Some work around for adapting Android settings is introduced as well.

You're going to have to give a much better explanation of what this 
does.  For people who don't know what Built-In CDROM support is, what 
you wrote is meaningless.

For example, how is BICR support different from the CDROM support 
already present in the driver?  And what's so special about it that it 
needs its own kconfig setting?

> @@ -369,6 +372,10 @@ static void set_bulk_out_req_length(struct fsg_common *common,
>  	if (rem > 0)
>  		length += common->bulk_out_maxpacket - rem;
>  	bh->outreq->length = length;
> +
> +	/* some USB 2.0 hardware requires this setting */
> +	if (common->bicr)
> +		bh->outreq->short_not_ok = 1;

How is this connected with BICR?  If some USB 2.0 hardware requires this 
setting, shouldn't it always be turned on?

Besides, why does some hardware require this?  What goes wrong if 
short_not_ok is set to 0?  If it causes problems, why didn't we become 
aware of them many years ago?

> @@ -527,7 +534,16 @@ static int fsg_setup(struct usb_function *f,
>  				w_length != 1)
>  			return -EDOM;
>  		VDBG(fsg, "get max LUN\n");
> -		*(u8 *)req->buf = _fsg_common_get_max_lun(fsg->common);
> +		if (IS_ENABLED(USB_CONFIGFS_BICR) && fsg->common->bicr) {
> +			/*
> +			 * When Built-In CDROM is enabled,
> +			 * we share only one LUN.
> +			 */
> +			*(u8 *)req->buf = 0;
> +		} else {
> +			*(u8 *)req->buf = _fsg_common_get_max_lun(fsg->common);
> +		}

This is a very strange way of enforcing a single-LUN restriction.  Why 
do it here?  A much more logical place would be where cfg->nluns is set 
up originally.

> +		INFO(fsg, "get max LUN = %d\n", *(u8 *)req->buf);

This debugging line isn't needed.

>  		/* Respond with data/status */
>  		req->length = min((u16)1, w_length);
> @@ -1329,7 +1345,7 @@ static int do_start_stop(struct fsg_common *common)
>  	}
>  
>  	/* Are we allowed to unload the media? */
> -	if (curlun->prevent_medium_removal) {
> +	if (!curlun->nofua && curlun->prevent_medium_removal) {

How is nofua connected to BICR?  Or to prevent_medium_removal?

>  		LDBG(curlun, "unload attempt prevented\n");
>  		curlun->sense_data = SS_MEDIUM_REMOVAL_PREVENTED;
>  		return -EINVAL;
> @@ -2692,6 +2708,7 @@ int fsg_common_set_cdev(struct fsg_common *common,
>  	common->ep0 = cdev->gadget->ep0;
>  	common->ep0req = cdev->req;
>  	common->cdev = cdev;
> +	common->bicr = 0;
>  
>  	us = usb_gstrings_attach(cdev, fsg_strings_array,
>  				 ARRAY_SIZE(fsg_strings));
> @@ -2895,6 +2912,33 @@ static void fsg_common_release(struct fsg_common *common)
>  		kfree(common);
>  }
>  
> +#ifdef CONFIG_USB_CONFIGFS_BICR
> +ssize_t fsg_bicr_show(struct fsg_common *common, char *buf)
> +{
> +	return sprintf(buf, "%d\n", common->bicr);
> +}
> +
> +ssize_t fsg_bicr_store(struct fsg_common *common, const char *buf, size_t size)
> +{
> +	int ret;
> +
> +	ret = kstrtou8(buf, 10, &common->bicr);
> +	if (ret)
> +		return -EINVAL;
> +
> +	/* Set Lun[0] is a CDROM when enable bicr.*/
> +	if (!strcmp(buf, "1"))
> +		common->luns[0]->cdrom = 1;
> +	else {
> +		common->luns[0]->cdrom = 0;
> +		common->luns[0]->blkbits = 0;
> +		common->luns[0]->blksize = 0;
> +		common->luns[0]->num_sectors = 0;
> +	}
> +
> +	return size;
> +}

Where do these attributes ever get exported to sysfs?

> +#endif
>  
>  /*-------------------------------------------------------------------------*/
>  
> @@ -3463,6 +3507,7 @@ void fsg_config_from_params(struct fsg_config *cfg,
>  		lun->ro = !!params->ro[i];
>  		lun->cdrom = !!params->cdrom[i];
>  		lun->removable = !!params->removable[i];
> +		lun->nofua = !!params->nofua[i];

Isn't this set already?  If not, it is a bug that has nothing to do with 
BICR.

>  		lun->filename =
>  			params->file_count > i && params->file[i][0]
>  			? params->file[i]
> diff --git a/drivers/usb/gadget/function/f_mass_storage.h b/drivers/usb/gadget/function/f_mass_storage.h
> index 3b8c4ce2a40a..7097e2ea5cc9 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.h
> +++ b/drivers/usb/gadget/function/f_mass_storage.h
> @@ -140,5 +140,8 @@ void fsg_common_set_inquiry_string(struct fsg_common *common, const char *vn,
>  void fsg_config_from_params(struct fsg_config *cfg,
>  			    const struct fsg_module_parameters *params,
>  			    unsigned int fsg_num_buffers);
> -
> +#ifdef CONFIG_USB_CONFIGFS_BICR
> +ssize_t fsg_bicr_show(struct fsg_common *common, char *buf);
> +ssize_t fsg_bicr_store(struct fsg_common *common, const char *buf, size_t size);
> +#endif
>  #endif /* USB_F_MASS_STORAGE_H */
> diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
> index f7e6c42558eb..8fe96eeddf35 100644
> --- a/drivers/usb/gadget/function/storage_common.c
> +++ b/drivers/usb/gadget/function/storage_common.c
> @@ -441,6 +441,29 @@ ssize_t fsg_store_file(struct fsg_lun *curlun, struct rw_semaphore *filesem,
>  		return -EBUSY;				/* "Door is locked" */
>  	}
>  
> +	pr_notice("%s file=%s, count=%d, curlun->cdrom=%d\n",
> +			__func__, buf, (int)count, curlun->cdrom);

Another debugging line that shouldn't be present in the final patch.

> +
> +	/*
> +	 * WORKAROUND for Android:
> +	 *   VOLD would clean the file path after switching to bicr.
> +	 *   So when the lun is being a CD-ROM a.k.a. BICR.
> +	 *   Don't clean the file path to empty.
> +	 */
> +	if (curlun->cdrom == 1 && count == 1)
> +		return count;
> +
> +	/*
> +	 * WORKAROUND: Should be closed the fsg lun for virtual cd-rom,
> +	 * when switch to other usb functions.

That is not a grammatical English sentence.

> +	 * Use the special keyword "off", because the init can
> +	 * not parse the char '\n' in rc file and write into the sysfs.
> +	 */
> +	if (count == 3 &&
> +			buf[0] == 'o' && buf[1] == 'f' && buf[2] == 'f' &&
> +			fsg_lun_is_open(curlun))
> +		((char *) buf)[0] = 0;

This seems like another bug fix that has no connection with BICR.

Alan Stern

> +
>  	/* Remove a trailing newline */
>  	if (count > 0 && buf[count-1] == '\n')
>  		((char *) buf)[count-1] = 0;		/* Ugh! */
> -- 
> 2.18.0
