Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E311DAAD7
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 08:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgETGmY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 02:42:24 -0400
Received: from mail-lf1-f48.google.com ([209.85.167.48]:44362 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgETGmX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 02:42:23 -0400
Received: by mail-lf1-f48.google.com with SMTP id w15so1536590lfe.11
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2020 23:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WUXep5lXmISJDJF97yPP9JoeqyHlN9IkRe6F6vXyT7Q=;
        b=Flfxnc8wBPCUHCOYkMT/jOb6WiERFTqmZc/iyUvtfgLD5GZtUPDxE0ohwmgswRhotp
         NZ+kcnozTvtBJ26KQc0CVpCVeqXTwlJBYorMYQ889Jhha2rDqrsPY2wL+zl3eHfgryzf
         TuUlFbeuFFxo6UzZS7XunRV/UNG8ddE2r9rmpx68B7djnqIDVJOz8bie2yKMzkUS2D5n
         PECtdMDhUAp7ENSpYuwfINI8hpI+ZtGWwovEYpwCd2WbxeU7RhjzwaShlpjuWtCUMzk2
         DbQfxVzLs5kCuBNUwbmZLmOeiNlNvAE58sZG61h+PfsxOd4/jGXlvceyJYcaY0FMELjv
         KfOw==
X-Gm-Message-State: AOAM531maRUHDjuEpBpJrn8ov4OJQ0JRuoINSGRDsE+XuBc5sDF5Lqxa
        8cQbBPXsx6/xnILGDs6T8vcq+O8U
X-Google-Smtp-Source: ABdhPJxUK9x76uGzMJxVov2AqfYl4QAVJ7P+PWznFZ1+xAOPCX4zCRqCjpA9MWEVEyxeyAxZHPIZPA==
X-Received: by 2002:a19:c3d5:: with SMTP id t204mr1719962lff.50.1589956941887;
        Tue, 19 May 2020 23:42:21 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id s9sm806688ljc.43.2020.05.19.23.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 23:42:20 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jbIQm-0003sa-1B; Wed, 20 May 2020 08:42:20 +0200
Date:   Wed, 20 May 2020 08:42:20 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Oliver Neukum <oneukum@suse.com>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: question on tty_operations->flush_char()
Message-ID: <20200520064220.GG27787@localhost>
References: <1589902789.6470.8.camel@suse.com>
 <20200520053549.GA2172873@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520053549.GA2172873@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020 at 07:35:49AM +0200, Greg Kroah-Hartman wrote:
> On Tue, May 19, 2020 at 05:39:49PM +0200, Oliver Neukum wrote:
> > Hi,
> > 
> > is the flush_char() opertion of tty_operations allowed to sleep?
> 
> "flush_chars"?
> 
> I am pretty sure, given that the caller locations of it sleep before
> they call it.  I thought I documented stuff like that a long time ago,
> maybe not :(

I agree, I don't see why that wouldn't be allowed currently.

Johan
