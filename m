Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE79F1357EF
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 12:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbgAIL27 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 06:28:59 -0500
Received: from mga18.intel.com ([134.134.136.126]:17461 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728588AbgAIL26 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jan 2020 06:28:58 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 03:28:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,413,1571727600"; 
   d="scan'208";a="227175924"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 09 Jan 2020 03:28:56 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 09 Jan 2020 13:28:55 +0200
Date:   Thu, 9 Jan 2020 13:28:55 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 04/15] usb: typec: Make the attributes read-only when
 writing is not possible
Message-ID: <20200109112855.GA29437@kuha.fi.intel.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
 <20191230142611.24921-5-heikki.krogerus@linux.intel.com>
 <20200109094625.GA50000@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200109094625.GA50000@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 09, 2020 at 10:46:25AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Dec 30, 2019 at 05:26:00PM +0300, Heikki Krogerus wrote:
> > For now the read-writable attribute files have made a check
> > in their store callback function to see does the underlying
> > port interface support changing the value or not, and when
> > it didn't, the callbacks returned -EOPNOTSUPP. From user
> > perspective that is not ideal, as there is no way to know is
> > changing the value possible beforehand.
> > 
> > Instead of returning -EOPNOTSUPP, making the attribute file
> > read-only when the operation is not supported.
> 
> As fun as this is, if someone then changes the permission on the sysfs
> file, trying to write to them will now crash the kernel, right?
> 
> So I think you need to leave this check in:
> 
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 08923637cd88..3abcfa09ecdf 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -373,12 +373,9 @@ static ssize_t active_store(struct device *dev, struct device_attribute *attr,
> >  		}
> >  	}
> >  
> > -	/* Note: If there is no driver, the mode will not be entered */
> > -	if (adev->ops && adev->ops->activate) {
> > -		ret = adev->ops->activate(adev, enter);
> > -		if (ret)
> > -			return ret;
> > -	}
> > +	ret = adev->ops->activate(adev, enter);
> > +	if (ret)
> > +		return ret;
> >  
> >  	return size;
> >  }
> 
> We had to go add this type of check to some subsystems recently that had
> this same problem, I don't want to have to go and add it back for this
> one as well :)

You are correct. I'll leave the check in.

thanks,

-- 
heikki
