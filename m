Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACC6E36EEC
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 10:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbfFFIlj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 04:41:39 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:34854 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfFFIli (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 04:41:38 -0400
Received: by mail-wr1-f51.google.com with SMTP id m3so1483316wrv.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Jun 2019 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VqhXzdqvcYOThqW56WF3BqojYE8dWJhuh1y93bHdlqY=;
        b=mcC+30mLls3yAQVyOdCs9XnTVIax/UYPDJQOmPsa3Ew5kyYf6dJEFKHgCzVLr+R1Sr
         h3lFPE2WMASzJmwHC/TmdQYw7QIDHJz1NV2bVmxnFANnWzYk26KtPSSkysW54EOkcRU9
         zKapbh1RQlbCAYzMtgcZoDiPOebaK+yt/h33hQO1gdX/y9wEEp4pZ2kYSn1cOeB6cPEo
         /k3TitxnHizHkm1xKkt6vqBwHbyA1obiNKM5ADRO0Vw4IaLfkYtlUGOvnu5GXp7buDqN
         tx675+JrrVKEK+azlGNoh1NPkagrfl0zq2DlyTh70P0Fki4FlgPv8Z+SUyJNjvSWRf+U
         hU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VqhXzdqvcYOThqW56WF3BqojYE8dWJhuh1y93bHdlqY=;
        b=TUGOIJpk+mYS2o6KsI+2tGAPrYFAha/ga7zg4RZoRFTky81HD06udskmgl/9lfkChc
         q+AeyEzdH1PadSm3ojeFx1ISMmWnNWRwFQRwNPrr0DRQ+i+5bUIqbC/ruxg2tVLpZu+4
         PrrR4rJlYacQbbk2XSaDiOB4LRmPSSWkQrcm2Czg0IeVYkA9ZHRIKw4lTlGhh8Run2Ga
         +isHZ0kqUmNfXM24Yu8mFl+xw0ri2DtEWGjlSC8dIbTwU0lmEjDMZvh1HIw1ZQOx/O5s
         J+sJmET91/xXvSyTWZH8tSAzZOWTQMEjnuiRve47X5udGKTdky9I+c8dm0kqvLjavNIE
         QVGw==
X-Gm-Message-State: APjAAAU+xPZZoftJe3QJTuENsN11cDVNqw3iiTZNuSvkaWZSwHl81Ojb
        xujk5aaCNzhtYrtk0sSiMV3+nfZYLio=
X-Google-Smtp-Source: APXvYqwsyDFswViQswe9yZfWgI7oAkoxEtH4Rwy1lV+KAZmurfbWMpTYupu2Pccu5QCgBXvYz7RNrA==
X-Received: by 2002:a5d:4f81:: with SMTP id d1mr5559311wru.156.1559810496811;
        Thu, 06 Jun 2019 01:41:36 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id o126sm1105453wmo.31.2019.06.06.01.41.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 01:41:36 -0700 (PDT)
Message-ID: <2387746fa7c61a4fe9a994cbece186731eac7fa9.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Date:   Thu, 06 Jun 2019 10:41:35 +0200
In-Reply-To: <20190605173902.GE27700@kroah.com>
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
         <20190530132522.GA21005@kroah.com>
         <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
         <20190604054300.GE1588@kroah.com>
         <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
         <20190605145525.GA28819@kroah.com>
         <0c2adde7154b0a6c8b2ad7fc5258916731b78775.camel@unipv.it>
         <463fb315f901783543c3bd5284523912c3c31080.camel@unipv.it>
         <20190605173902.GE27700@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno mer, 05/06/2019 alle 19.39 +0200, Greg KH ha scritto:
> On Wed, Jun 05, 2019 at 06:23:58PM +0200, Andrea Vai wrote:
> [...]
> In ssh I manually mount the media,
> then
> > run
> > 
> > touch begin
> > date
> > <cp command>
> > date
> > touch end
> 
> That tests nothing other than the size of the memory in your system
> :(
> 
> You have to flush the data out to the device fully in order to
> properly
> measure device throughput.  Calling 'touch' does not do that.
> 
> > If I use the DE (where the media is mounted automatically) I used
> to
> > "eject" the media after the copy finished, and took note of the
> time
> > used until the media was correctly "ejected" (and, so, unmounted).
> 
> eject/unmount is good.
> 
> > Anyway, I know that I can do all of this in a better way, and will
> let
> > you know.
> 
> Yes, please do so, your steps above do not show much.

so, just to be sure now, here is my test script:

touch inizio
date
mount UUID="6a9d3c05-6758-49c0-a46e-6ce221478eb3" /mnt/pendrive
cp /NoBackup/buttare/ubuntu-14.04.5-desktop-i386.iso /mnt/pendrive
umount /mnt/pendrive
date
touch fine

can you please confirm (if) it's fine?

> 
> And you need to get your auto-mount out of the way, as who knows
> what
> options your device is being mounted with (i.e. sync or no
> sync).  You
> have to control that yourself in order to be sure.

yes, I disabled the auto-mount. Furthermore, is there any option I
need to specify to the mount command (i.e., as you say, sync or no
sync)?

thanks,
bye
Andrea

