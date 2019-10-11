Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2EE8D42B3
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 16:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbfJKOXA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 10:23:00 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42162 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbfJKOXA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 10:23:00 -0400
Received: by mail-lf1-f66.google.com with SMTP id c195so7167491lfg.9;
        Fri, 11 Oct 2019 07:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S3rz5KInV3mTt7kGQSPB4VeyIaD00X/PVCmOmkNi/do=;
        b=aJsMjcKM67+5XEzCAgA296YRiWfcACsdcOUfGGSeqNqk0Yp07aoOm6OfeLW3eyU5Oj
         q5dUnhm0kr0DcEb1d13Fos5cCCh6M/Sx+CXHk+JdiBxIbhMnsxyhEbW7orQP6L0ws22S
         IDmpzDkU+iD0RL2gxYlNf7eewFKmie9Dp0HyweDQIF6xZQO8SC/qwx66qhrZyiLgIg0g
         JQI1B1eVfkY6q1IPNl54hKpopBnQV1KX18qxl1Ucxf02nyW2xRw6JWbwIsz3gMuRPSHl
         v1rR5kZ2mr1ogNvfZAF/wBsITkwX94TvLR9B/xNiJnDEi7AAfXIG70dMh9dX0NyeIVdI
         FDRQ==
X-Gm-Message-State: APjAAAX9Id2DDLvixcnV8jRsRy0agH8i1THYgAKdu9MSYw8lSzFbXnot
        SRoAoJ5D6Rz7SZYZYgoWSVM=
X-Google-Smtp-Source: APXvYqwBmbjVZw6TIud7A1nZLdwVxJ08GywE7fv8kmVetKeg62ghaCBI8EiZtR+7ENdeMime3/iNPg==
X-Received: by 2002:ac2:4c99:: with SMTP id d25mr9618630lfl.112.1570803778483;
        Fri, 11 Oct 2019 07:22:58 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id i128sm1899754lji.49.2019.10.11.07.22.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 07:22:57 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iIvoz-00014c-2P; Fri, 11 Oct 2019 16:23:09 +0200
Date:   Fri, 11 Oct 2019 16:23:09 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org, walter harms <wharms@bfs.de>
Subject: Re: [PATCH v2] USB: legousbtower: fix a signedness bug in
 tower_probe()
Message-ID: <20191011142309.GK13531@localhost>
References: <5DA088DE.5040902@bfs.de>
 <20191011141115.GA4521@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011141115.GA4521@mwanda>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 11, 2019 at 05:11:15PM +0300, Dan Carpenter wrote:
> The problem is that sizeof() is unsigned long so negative error codes
> are type promoted to high positive values and the condition becomes
> false.
> 
> Fixes: 1d427be4a39d ("USB: legousbtower: fix slab info leak at probe")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Johan Hovold <johan@kernel.org>

> ---
> v2: style improvement suggested by Walter Harms.
> 
>  drivers/usb/misc/legousbtower.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
> index 9d4c52a7ebe0..9bd240df8f4c 100644
> --- a/drivers/usb/misc/legousbtower.c
> +++ b/drivers/usb/misc/legousbtower.c
> @@ -881,7 +881,7 @@ static int tower_probe (struct usb_interface *interface, const struct usb_device
>  				  get_version_reply,
>  				  sizeof(*get_version_reply),
>  				  1000);
> -	if (result < sizeof(*get_version_reply)) {
> +	if (result != sizeof(*get_version_reply)) {
>  		if (result >= 0)
>  			result = -EIO;
>  		dev_err(idev, "get version request failed: %d\n", result);
