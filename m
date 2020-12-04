Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEBF22CE9A0
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 09:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729064AbgLDIb1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 03:31:27 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42683 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbgLDIb0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 03:31:26 -0500
Received: by mail-lj1-f193.google.com with SMTP id f18so5622278ljg.9
        for <linux-usb@vger.kernel.org>; Fri, 04 Dec 2020 00:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5cPF/6zbncaQd1WjFYzcWr65VyxStJ3XiUmMpu6dyf4=;
        b=UNrALye49Bn5eyifZ1cUFQMPDJGTxepnWrQN72r5VLwXQTCtV0f91Wl3WyiI/n1EkD
         mBRH/upZLsufboPztlFHBg90p46JtPo9KLDROXZCHL0IZoobLk+EXWIg+PzsNKL+cajp
         XU5B+2+xxfKbGJx+D6krwTw5gbOo1pJGqVLOWueVEcN+BKwPaCDc+NsSKjs/nPgTl1ML
         lzaHCaaOh7OTe8sQMAZU3/JGck/UY9YFGaR+0dYbbiRbgjZHWHaPwGlh/VF97XZLTNp3
         /B/qjza/d1qMlQDxNFL4wZ2hgqTmiBCpnAc6X7J+mmpAx/Tg2+RrDyBfu03osGuBrp5x
         EnoQ==
X-Gm-Message-State: AOAM531SlzN0r6wKeN+sIzBqHRkgHNIWIjMCAng0NhMZav6v23RWCV2c
        YvUL+pXin3l9jYq4x0+Vf90=
X-Google-Smtp-Source: ABdhPJzD21zOwvZgEfHyN2S+U87Y6AuKrY1hRLe8FPh5OEpUR38rb2jPPA4XdinPhJY8yjC4+0qDIg==
X-Received: by 2002:a05:651c:1391:: with SMTP id k17mr3093902ljb.277.1607070644840;
        Fri, 04 Dec 2020 00:30:44 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id v7sm1450095lfd.235.2020.12.04.00.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 00:30:44 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kl6Un-0001Y8-No; Fri, 04 Dec 2020 09:31:17 +0100
Date:   Fri, 4 Dec 2020 09:31:17 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Ensar Karabudak <ensar@sixfab.com>
Cc:     linux-usb@vger.kernel.org, johan@kernel.org, bjorn@mork.no
Subject: Re: [Bug Report] ttyUSB not detected after upgrade to 5.4.66+
Message-ID: <X8nz1f45yqBotP/i@localhost>
References: <CAB-YqyOub41nfq3AdF=j9Mww95YGMuv_ZFPHTY21-xPNNsu3MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB-YqyOub41nfq3AdF=j9Mww95YGMuv_ZFPHTY21-xPNNsu3MA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 04, 2020 at 01:07:24AM +0300, Ensar Karabudak wrote:
> Hi,
> I have mentioned it here before:
> https://github.com/raspberrypi/linux/issues/3964
> 
> I’ve run into an issue with the Quectel BG96 module. I do not have anything
> on ttyUSB3 and 2.
> It appears as though some changes in 5.4.66 have affected how USB2-USB3 is
> treated?

Thanks for the detailed report. Björn has already submitted a fix which
will be backported to the stable trees soonish. You can find it here if
you want to give it a try:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-linus&id=c98fff7332dbd6e028969f8c2bda3d7bc7a024d8

Johan
