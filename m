Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 996221E766D
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 09:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgE2HQA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 03:16:00 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37829 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgE2HP7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 03:15:59 -0400
Received: by mail-lj1-f195.google.com with SMTP id e4so1339261ljn.4
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 00:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i1sRQ4Wpabta+J38efE2EYsPusVk+TXIpoCktYaWR9w=;
        b=V1StnNf6IaKLCmdlkkQn8Tw9oaCm+58wtAZsKBwpd+5BBL2lQpIiBEmLEEjjuiKWPp
         lyBG4KGifuClbtyrf9KM6yGKpuKHfSjOiNshaMtmvnt2jrC91O2MMOUDViqolfZl4LLO
         wj6GmkWG3UrTn05EXFqZB4cKkiSyEA2WTLaRwTj0XP82Tdw/KPcoUdlNq7/1juWP+dMB
         885Rw1hekYipCgNFdZP2+WR4dZuyDNZ/PeEc1Q8yJLMujomSyDrRaAY4ZIzXJ+NX8bus
         VWtpKXMckYVo8jfLhcNh4tjTTPOhtjWHTKELNVBH9GvaNYtS6FQ0k0fPtLO6vtkCrIR+
         jnkw==
X-Gm-Message-State: AOAM532ps6niP5JXg0W4xFZ1/zNrRe63Fm9iL7LRNgjRryB+WwMQbTGQ
        YmSmnKJta37ocwSnDyphq2LubEzm
X-Google-Smtp-Source: ABdhPJyq01ZDX0W09V7LxcyQdtLZ3EO1wxQ794/6BYqxhpfi+/iG+ub3bXr/2aQj/TnSQ8EigATxig==
X-Received: by 2002:a2e:9105:: with SMTP id m5mr3723972ljg.408.1590736557200;
        Fri, 29 May 2020 00:15:57 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id t19sm2055666lft.47.2020.05.29.00.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 00:15:56 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jeZFA-0003AZ-1j; Fri, 29 May 2020 09:15:52 +0200
Date:   Fri, 29 May 2020 09:15:52 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH v2 3/6] USB: serial: ch341: Limit prescaler on quirky
 chips
Message-ID: <20200529071552.GA19480@localhost>
References: <cover.1585697281.git.public@hansmi.ch>
 <ee0499594a75018c0e31da4af9feb8a322ff448d.1585697281.git.public@hansmi.ch>
 <20200514141743.GE25962@localhost>
 <20200527131658.GJ5276@localhost>
 <d8d0aabe-0ea2-dac9-e2ba-38306567610b@msgid.hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8d0aabe-0ea2-dac9-e2ba-38306567610b@msgid.hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 27, 2020 at 05:41:56PM +0200, Michael Hanselmann wrote:
> On 27.05.20 15:16, Johan Hovold wrote:
> > I've applied the above fix on top of your quirk-detection patch so that
> > we can get this into 5.8 and backported to stable.
> 
> I tested ch341 on usb-next at c432df15591958. The adapter kept working
> for all tested baud rates from 75 to 200000 in 75bd intervals.

Great, thanks for testing!

Johan
