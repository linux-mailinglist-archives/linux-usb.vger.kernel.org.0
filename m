Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF761B38A1
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 09:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbgDVHOx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 03:14:53 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34142 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbgDVHOw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 03:14:52 -0400
Received: by mail-lj1-f193.google.com with SMTP id m8so1155202lji.1
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2020 00:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0Pw17I897aXUonIrbFbh8qW7e0mQ5JxCj9nhdy2vHfw=;
        b=PByf3kl8jdlfWRjq1QrwOPQr8iBFp/rSjEkvcRe10t1Sf5iUK6x2Q2xQniogPye6n8
         YQW2KYZ8HoSD2ug0rqYaAxtE8RzKcZt4PCA0lBKDJHr6FsqSERbcxKeEDryqzertID9b
         cAtOsrxoLHFpNpXx7hWVR9x41yib1HrRmeGtPEAvnEdcjE/FvJSg6Rr7DwW59818Sfvv
         QWMxQVowHO/K7WR3ZYGKk1J8mGNc3uLyrRrAUXbhBs2Vgctc+peyBPySNvPfl2hHhxZB
         iJbgHb/+M6kpLgOMOiemQjoDfnFM9z7aNYNGK3M+M6fx9JxRkAmDeG8h/oOq3oatE7mZ
         wU4A==
X-Gm-Message-State: AGi0PuYSeC/l5/bBOy3Jl1fngqqLznJrOePX4YtkumNXrXgnlfTzAQLF
        IBUe5B/BNPoDSQwKpVRc1lM=
X-Google-Smtp-Source: APiQypIbmb7jEF7e1eY8RUcQ0Jjc2/ujr6K8jCXUoUR5YmvheUNzi0i9y/jzMtQwFWpszC/B3xjkZw==
X-Received: by 2002:a2e:81cc:: with SMTP id s12mr15471699ljg.90.1587539691145;
        Wed, 22 Apr 2020 00:14:51 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 25sm3908731lft.68.2020.04.22.00.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 00:14:50 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jR9az-0001Wb-8E; Wed, 22 Apr 2020 09:14:57 +0200
Date:   Wed, 22 Apr 2020 09:14:57 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] garmin_gps: add sanity checking for data length
Message-ID: <20200422071457.GG18608@localhost>
References: <20200415140304.471-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415140304.471-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 15, 2020 at 04:03:04PM +0200, Oliver Neukum wrote:
> We must not process packets shorter than a packet ID
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Reported-and-tested-by: syzbot+d29e9263e13ce0b9f4fd@syzkaller.appspotmail.com

Applied with a Fixes and CC-stable tag as technically this is a
minuscule slab info leak.

Johan
