Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED4768EF36
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 17:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbfHOPUG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 11:20:06 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38194 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728662AbfHOPUG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 11:20:06 -0400
Received: by mail-pg1-f193.google.com with SMTP id e11so1430127pga.5
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 08:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ab/77+kQbrAu+raRKeV4nLprWDGh+BMS6F0zkUe7w6U=;
        b=AShm35gzNjTUaie+TT5wVyFpIGqin3y7DTmj+vOvYFUC6+MS8QVfMh6bbMGfuU9gGb
         DBLgng/LYxnhhVrous14RmMH9F+2oHiduKgaSWk/K9l/Ap46ePkRT+5dhqfMDiBi/b8H
         eeZ5G/OWV6UAxThww4qoIgzUohJc0+1d/61vLHFRr1ohC+hCr8QWHb1oEN+yW6wIbBbX
         KUK3zrfnOOb8hvvA/BKlFqIIUUJ0K6+21DiSajOgH90xML83/mc+MwJ1ezFwigZSVvan
         3LBGuGeMP959hDaNG9wz+nZbu9SZO/ca7ejDY67E8eEB1cEB+HFrCa44o3NQwsWvMPmq
         pDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ab/77+kQbrAu+raRKeV4nLprWDGh+BMS6F0zkUe7w6U=;
        b=IThrooCwO1Er2ZWXntvrgl8HIonDUqJzHAACYWIlTrz15jfNr0Y2J7E3dfXlMIus42
         fiylP7z8hbAnPCTGFeRKL1D4sA7kaxaBMcb66JFMJo8zv/C3zh8BWidWeOCAoPmTey6g
         4xCmPHn35VeVR2S1otFh68cYxZt5TZLWEBTb7R04gtXUIb50fAAP3DMJuzPxf6Frn3dq
         SDTkoqf+DgfDnk0clMGPIx5uhst919OMAmUhj9cF3fpbx9CW75yTLdTDnuV7MnrMqcUk
         m8PaUNmu3HP+rJokmnXhkQFRTCTZIsy+aBIx5yqSujYW9BgfBWMqMnOM7MJffH6eC8E7
         6pRQ==
X-Gm-Message-State: APjAAAUnA62mevGIVwc26K8peJTdCab/jd/wnY5HumXYVwwlwNtiFOSW
        PHrXBNtVlOuS61XjK11Hjsc=
X-Google-Smtp-Source: APXvYqw9wQpybyZAQLjdD/8lRTd62QhpnNzO2LBsmiCImcEVjATt6eAc95e7umlaqyd2htH8ltQKEQ==
X-Received: by 2002:a63:2364:: with SMTP id u36mr3721671pgm.449.1565882406052;
        Thu, 15 Aug 2019 08:20:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g18sm2617859pgm.9.2019.08.15.08.20.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 08:20:05 -0700 (PDT)
Date:   Thu, 15 Aug 2019 08:20:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Call fusb302_debugfs_init earlier
Message-ID: <20190815152004.GD23562@roeck-us.net>
References: <20190813101524.80673-1-hdegoede@redhat.com>
 <20190813105216.GD4691@kuha.fi.intel.com>
 <20190815125441.GB24270@kroah.com>
 <20190815133159.GB24772@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815133159.GB24772@kuha.fi.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 15, 2019 at 04:31:59PM +0300, Heikki Krogerus wrote:
> > 
> > As Guenter points out, don't check this, just call it anb move on.
> > 
> > But are you _SURE_ you want this to be the name, at the root of debugfs?
> > Why not put it under the usb debugfs directory?
> 
> That's a good point. Let's move it there while at it.
> 
Maybe we should move the tcpm root as well ?

Guenter
