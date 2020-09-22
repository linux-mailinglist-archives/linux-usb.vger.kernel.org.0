Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6398C274160
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 13:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgIVLsx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 07:48:53 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41512 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbgIVLry (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Sep 2020 07:47:54 -0400
Received: by mail-lf1-f66.google.com with SMTP id y17so17674722lfa.8
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2020 04:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8G+mOBxI+1puuYrVc+al/xw8kYYWI84tyCgsHw+t4G0=;
        b=mEuvbyPf9KX78En1yUP/BGnW8bDV1Zw3JswUNnt+ZEZpW3aqtgNRjAdXlsj0/OtQZn
         kU4p8A6p+OebqXYpXbjSaPX3OFBFTF8xz3Yzda1LD2D1NDu8SqmYDaBfFx4QKyOZPR1w
         K/K4Y9q2vq3xZewpJEyU2NyoOE5Ox6o0kWgBc/nCIXucUkBTe8QX4k2RBLv+OooXfYeq
         w1dQWLLG3ib0sdXXudddhNMh8wTwMii/KGKyxlfzR2p/vrbnrpeiSO8cL3rFi+r3ezie
         02iGOCS00+OCEutsw/SL16XIi0IVRP/M4v38esdhfamBaQ4+n3zLqd4P15dlEsBE2P2+
         ZrVw==
X-Gm-Message-State: AOAM531D/A/sA7ovo+YhW1ETt4CQaXHKfSJW50l/iYinqJDdHCIRT38j
        f04SyKTMo3FkBpZ61qCIsfM=
X-Google-Smtp-Source: ABdhPJw4WOXPdt7tkcnOPXS+bn2HU8kmr3BFIkRlHs7VBCoKFeXuf0lBd3DLfRL3tykJnEVkt4movw==
X-Received: by 2002:a05:6512:d2:: with SMTP id c18mr1435987lfp.547.1600775272636;
        Tue, 22 Sep 2020 04:47:52 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id r4sm3440954lfc.162.2020.09.22.04.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 04:47:51 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kKglt-0003m6-K9; Tue, 22 Sep 2020 13:47:45 +0200
Date:   Tue, 22 Sep 2020 13:47:45 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, Erik Slagter <erik@slagter.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Subject: Re: [PATCH v2 4/4] USB: cdc-acm: clean up no-union-descriptor
 handling
Message-ID: <20200922114745.GD24441@localhost>
References: <20200921135951.24045-5-johan@kernel.org>
 <1600697816.2424.102.camel@suse.com>
 <20200921142806.GX24441@localhost>
 <1600700674.2424.105.camel@suse.com>
 <20200921151605.GY24441@localhost>
 <1600708657.2942.2.camel@suse.com>
 <20200922070506.GZ24441@localhost>
 <1600771242.6926.16.camel@suse.com>
 <20200922105446.GC24441@localhost>
 <1600774866.6926.18.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600774866.6926.18.camel@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 22, 2020 at 01:41:06PM +0200, Oliver Neukum wrote:
> Am Dienstag, den 22.09.2020, 12:54 +0200 schrieb Johan Hovold:
> 
> > Heh. Did you actually read the commit message?
> > 
> > 	"Add NO_DATA_INTERFACE quirk to tell the driver that "control"
> > 	 and "data" interfaces are not separated for this device, which
> > 	 prevents dereferencing a null pointer in the device probe
> > 	 code."
> > 
> > Convinced yet?
> 
> This patch does not fully match its description. Very well. Proceed.
> Could you resubmit and I'll ack?

I think you can just ack whole series by replying to 0/4. If Greg wants
it resubmitted I'll include that ack when resending. Works for you?

Johan
