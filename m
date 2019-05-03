Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 348EB12903
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 09:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbfECHlE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 03:41:04 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39817 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfECHlD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 03:41:03 -0400
Received: by mail-lf1-f67.google.com with SMTP id d12so3742393lfk.6
        for <linux-usb@vger.kernel.org>; Fri, 03 May 2019 00:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HHQVaoB+B0C7wA8aFsCAz60Qpl4DJWp3V1XxQNCMyxk=;
        b=q+sPEgzhHe04Vc/wQl+BTpPK7iWb5iJiioJJMdvFAo9gstVht0mK7vQoT3r3Xft1CZ
         4oieC2xL66drqmQ4AzlCQ6xh12SXUbIxdOAsZYJRVVlTsVYDmD5CV3avGH8wHcRB17bf
         XJdBSEZnBk48er9GePafXlAjmgLcpPnsrTJgYYjAPJk5QiFkqFAI+neI/WMMluLjaG10
         5NvefTOkMDV9Ngq0bugwjYS0u7IppNQr04DxXq3vO2BJB1nRHc9cRQt9tBDEdwqL2AuN
         YlfhvuW9N2tST2lRpyJXSGiifclR5s7g7zGqvDSN1hq/jZZgHfP82m4XvLJAyluthpKJ
         rjKw==
X-Gm-Message-State: APjAAAWVBJsghyQffUFHKqIUr7LrmoVILTkkhwQB8UMOXQiu1l71V/PU
        GdOo6qNYzdF7BYiPGUvJAkA=
X-Google-Smtp-Source: APXvYqxixtPe+Ep48A3qg6HHaw1nKxCooV13GUMCgjP0sV/YWRXYQ86Csh1zkm/iuWcUZx1LfRDfRw==
X-Received: by 2002:a19:e619:: with SMTP id d25mr3077847lfh.66.1556869262099;
        Fri, 03 May 2019 00:41:02 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id s26sm245283ljj.52.2019.05.03.00.41.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 00:41:01 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hMSoj-0006Cx-JN; Fri, 03 May 2019 09:41:13 +0200
Date:   Fri, 3 May 2019 09:41:13 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] [PATCH v2] USB:serial:pl2303:Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190503074113.GA17809@localhost>
References: <20190429121237.13136-1-charlesyeh522@gmail.com>
 <20190503071128.GB26546@localhost>
 <CAAZvQQ6EmDu-Rh_LTGCpz7T=3BbCvP=tUDRo=HCCgqscwn8+zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAZvQQ6EmDu-Rh_LTGCpz7T=3BbCvP=tUDRo=HCCgqscwn8+zA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 03, 2019 at 03:28:04PM +0800, Charles Yeh wrote:
> Johan Hovold <johan@kernel.org> 於 2019年5月3日 週五 下午3:11寫道：
> > What changed in v2? You forgot to add a changelog here.
> >
> > Looks like this one is not based on the current driver code (e.g. my
> > usb-next branch as we discussed), and also does not address some of the
> > issues raised so far (e.g. you're overwriting the entire flow control
> > register on updates).
> >
> 
> I used the Kernel tree:
> git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git
> 
> but the pl2303.c inside does not have the "pl2303_update_reg" you mentioned.

Perhaps you did not use the usb-next branch? That branch has the following
commit:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-next&id=f64c3ab230682e8395a7fbd01f3eb5140c837d4e

which adds the helper.

Johan
