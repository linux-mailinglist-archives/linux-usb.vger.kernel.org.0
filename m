Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C170CFC07
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 16:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfJHOKn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 10:10:43 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:51458 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfJHOKn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 10:10:43 -0400
Received: by mail-wm1-f41.google.com with SMTP id 7so3338713wme.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 07:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=egMXYOknQRi/HfO4C8rUYNk66iVEaK6CMMrTsjUWFPc=;
        b=ud1L74m+oKyUBJhssssCAEn/123EPi6uHtxdlOF3lX4HXImW3Uh03FjRwDX3GaFYNO
         78V/VtaI9gMkXpMW0TsQRmeVuOGOs29TQuF/pupm5g/VoyGb4n2oSPI3wC4vk8ng/0pu
         NKUwRaQAOoZRcGRSO0gYZE1CpSFiBrZYatgkDTcU+CBERW3DnQhbvCq53yecFgB17jIA
         qRzrESR2pgTBKusDnzBX8dmDiRlMeOqHE6lIVrv7C5B+d+zkk/co/TpF30WfNXFdeN+r
         KuiZJHY62wkz6OtjrF0BJD3OgzEewEJxNmyONErplZ4v3WvziL2a+NasUfNj1ppzWPF2
         6Zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=egMXYOknQRi/HfO4C8rUYNk66iVEaK6CMMrTsjUWFPc=;
        b=uNGeHw4dZnKnhcMLghYfa+JTo+zMbgcHr51HnUXW4nGkAUdVmUX2XR8KKCkly47Ft4
         TBj1WFPYan2RRVJdbp2453w/Hemko2I0SKK1WSNb2ve5/QC2TbYhkcYxZ/IjHWXOJhbf
         47Bze8RP/n4bTTVLVgRn0MVlPRiyBNQtbJ1MczsXve11ftZi8KLumd85/Lfeyq2Azu2G
         +P7XlqQPsdp6F61iRBsp/2hhsXeeVSFrl+zfBzSiVk9TvLK7LHJBM3m3V1o1sqhalQXv
         aziAsHFbtvEkj+OV0o53tyW4VaSpNHFHOfaxdjc2/kJttVc+SKcxcXId2mnzsVDPbwdy
         Xk9g==
X-Gm-Message-State: APjAAAVjW9eL4mTjMXINXbqAW+ajxhkWRObiz2gUeloalYR0FR/lSHyW
        EYzi6M9IzYotbhkQua7NxHd9ewB6y/My2w==
X-Google-Smtp-Source: APXvYqzkAA7irCvgq1s+76I2mkziGIe6pyrINP8e4Yoak1l5c5HrW0R1twC1jjsgfucyl4+IxJiyFw==
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr4061022wmh.76.1570543840961;
        Tue, 08 Oct 2019 07:10:40 -0700 (PDT)
Received: from dhe-pc (p54941CA4.dip0.t-ipconnect.de. [84.148.28.164])
        by smtp.gmail.com with ESMTPSA id t17sm39198658wrp.72.2019.10.08.07.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 07:10:39 -0700 (PDT)
From:   David Heinzelmann <heinzelmann.david@gmail.com>
X-Google-Original-From: David Heinzelmann <dhe@dhe-pc>
Date:   Tue, 8 Oct 2019 18:10:22 +0200
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     David Heinzelmann <heinzelmann.david@gmail.com>,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: hub: Check device descriptor before resusciation
Message-ID: <20191008161022.GA20011@dhe-pc>
References: <20191007153538.GA985210@kroah.com>
 <20191008080901.17628-1-heinzelmann.david@gmail.com>
 <20191008125546.GA2846493@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008125546.GA2846493@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 02:55:46PM +0200, Greg KH wrote:
> What happened to Alan's ack?
> 

I'm not sure I'm allowed to add someone else's acked-by tag?  
If so I will sent v5.

David
