Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE7E68C5D9
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 19:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjBFSdv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 13:33:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjBFSdu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 13:33:50 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589AE298C6
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 10:33:46 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id g13so8307893ple.10
        for <linux-usb@vger.kernel.org>; Mon, 06 Feb 2023 10:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nsA2UVbKCTYlnuVnGq05GHQ3hw+n0oCMRqJ/EEYmCkY=;
        b=a8JT7ViEx13ThcmUiyF2xIGmZel1FmMIdSxh9b0Ym1e2KCNGIjq3ebNFJPPKMOI95u
         GhBDm+LkD10tN/iUWquKpJbNLSNFJnBNO/D8osbz+qYNr+WpSQujzATCtuMNGVszNeHg
         oHN3nHQrwjq9vUmrCl7Ubj/+xvglHlx+BzeCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsA2UVbKCTYlnuVnGq05GHQ3hw+n0oCMRqJ/EEYmCkY=;
        b=OmQO8ohcfkKSbrAGMD4OjJGOhoAGM+RYYeb8WE4I9CW7GNSkHSJrqiFpfpcQLL+JgZ
         +aE1ykhLbDwQbpV1cI7X63qBboUgRBE9OMm7zXfMmQlMkUCylVi03Iz7fIm9pWjK6YBP
         uNemR5c+lLcoetBh3+Ygwfn7O2RwR1Ok9cr5k2WDPV/2YYZDwl2UM3XQvvJJ315MdvuP
         naFc3GBdKXtQ28uMrjpnCNg78iGI2iKWJiLq4LqfTJtBnXyG/hXA0k0MBYBo+ym22s+k
         BXTxoDSDyZlpE3ZjmWzTlFcCIqWGpQ7KN24J3813LjQ0bO9rM4EXHwvj8gyeSm11u3G8
         6EgA==
X-Gm-Message-State: AO0yUKWiwZlm4yra5nJhpNuVFA7lr+r+5/y4UmuIOwnHV+45EuZE6tX7
        ffk3rDUPxkypdJWDmCsmkcKQBuASK3GZwFor
X-Google-Smtp-Source: AK7set9CifVfSRS5Qx9jbb4Jap5R1rgc3MgAYSMbbYEKryXVkG5v6CbaQv+jxsMKlO/VLsbwWLKAdg==
X-Received: by 2002:a17:90a:1d2:b0:22c:1613:1656 with SMTP id 18-20020a17090a01d200b0022c16131656mr592787pjd.26.1675708425833;
        Mon, 06 Feb 2023 10:33:45 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y1-20020a17090a154100b0022bfa25dd88sm9995655pja.40.2023.02.06.10.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 10:33:45 -0800 (PST)
Message-ID: <63e14809.170a0220.7fcb2.150b@mx.google.com>
X-Google-Original-Message-ID: <202302061032.@keescook>
Date:   Mon, 6 Feb 2023 10:33:44 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] USB: ene_usb6250: Allocate enough memory for full object
References: <20230204183546.never.849-kees@kernel.org>
 <Y961c1/JIkDUqMbC@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y961c1/JIkDUqMbC@rowland.harvard.edu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Feb 04, 2023 at 02:43:47PM -0500, Alan Stern wrote:
> On Sat, Feb 04, 2023 at 10:35:46AM -0800, Kees Cook wrote:
> > The allocation of PageBuffer is 512 bytes in size, but the dereferencing
> > of struct ms_bootblock_idi (also size 512) happens at a calculated offset
> > within the allocation, which means the object could potentially extend
> > beyond the end of the allocation. Avoid this case by just allocating
> > enough space to catch any accesses beyond the end. Seen with GCC 13:
> 
> In principle, it would be better to add a runtime check for overflow.  
> Doing it this way means that the code could read an invalid value.
> 
> In fact, I get the impression that this code tries to load a data 
> structure which might straddle a page boundary by reading in just the 
> first page.  Either that, or else EntryOffset is always a multiple of 
> 512 so the error cannot arise.

Yeah, I couldn't figure it out. It seems like it might move in
non-512-byte steps too sometimes? Doubling the allocation (and zero-fill
it) seemed the safest way to cover it.

-Kees

-- 
Kees Cook
