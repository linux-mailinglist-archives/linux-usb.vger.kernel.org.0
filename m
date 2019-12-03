Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE47910F987
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 09:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbfLCIMC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 03:12:02 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42759 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbfLCIMC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 03:12:02 -0500
Received: by mail-lj1-f194.google.com with SMTP id e28so2667287ljo.9
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2019 00:12:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a1K3fic/EshDA+eymDtTJa9EnLBmZqZ1vzcZh+PKJR0=;
        b=p95n2Z029INfYDLpj2IQ+EQ4E97HVfC4lFwVJefMuYZ/vj5uSl47nnI0TYWPQoz/n0
         JAkJ8zLWsFFgPGVw5U1iNCXgvn+I0Mb7wL5nFnzRKp8xv0k15onipsK90MviE4ca69oK
         t2YpGthI49fz6H8ictxCNc4qbkFqw7m+SfDk0hQEkwg0F5FGcGoJoQLo/rvSLdCmj0dF
         6SMTaYNdDiib+EktiPriH6gwmIG3Yw6wwfdtBXoacbSmQvwzQnv17Q219UaxpgffhYmn
         965MrmA8Zjwhb3DyGCGB9eF3B+t2yDf+ayes1LvGId2fSYKu1E4C/DtbxbDkUzoPBtat
         y4mw==
X-Gm-Message-State: APjAAAWnuLHf9YeIJBoNGZsjg9f19i/4Mu393x5DmH8+kpA2bz0lgZAE
        90Yn4jXhFusPWobmMlC0Xnw=
X-Google-Smtp-Source: APXvYqzF6RW2lHSh0teMJQKF65Wbu5scqyOD1q+GtrNuMqrfjyuS6fG9WW+7i5bWMgkGEMvQdrj//Q==
X-Received: by 2002:a2e:9e55:: with SMTP id g21mr1712650ljk.245.1575360720499;
        Tue, 03 Dec 2019 00:12:00 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id e12sm836522lfc.52.2019.12.03.00.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 00:11:59 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1ic3Hy-0005nB-1A; Tue, 03 Dec 2019 09:12:06 +0100
Date:   Tue, 3 Dec 2019 09:12:06 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Fredrik Noring <noring@nocrew.org>
Cc:     Christoph Hellwig <hch@lst.de>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: Fix incorrect DMA allocations for local memory pool
 drivers
Message-ID: <20191203081206.GD10631@localhost>
References: <20191130165055.GA46622@sx9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191130165055.GA46622@sx9>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 30, 2019 at 05:50:55PM +0100, Fredrik Noring wrote:
> Fix commit 7b81cb6bddd2 ("usb: add a HCD_DMA flag instead of
> guestimating DMA capabilities") where local memory USB drivers
> erroneously allocate DMA memory instead of pool memory, causing
> 
> 	OHCI Unrecoverable Error, disabled
> 	HC died; cleaning up
 
> Fixes: 7b81cb6bddd2 ("usb: add a HCD_DMA flag instead of guestimating DMA capabilities") where local memory USB drivers

Looks like you copied a bit too much text here for the fixes tag.

Johan
