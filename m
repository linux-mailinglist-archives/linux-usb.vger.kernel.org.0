Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F766632CA7
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 20:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbiKUTLg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 14:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiKUTLf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 14:11:35 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AAC3D329A
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 11:11:34 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id u6-20020a17090a5e4600b0021881a8d264so9863794pji.4
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 11:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hdSzcHhKeQkatk8bqFSxlstBSa5XO6OBdkERXfzMdrQ=;
        b=YGs7CAMjf7UgX7lcenztkRFgVOI230bleLaIy5LovzqlyiR9XCz4k2qMKO0sygpFJe
         Bf2agTCFLpf3NxaMMQ5s0NqqhvdD1k4HXKYcz8sWgLeL8VRFnqI37ka/iRNPeYEvIjf/
         PHnBZ/FMt7rwbh/N/an8dqadyk6OTNqU5JM8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdSzcHhKeQkatk8bqFSxlstBSa5XO6OBdkERXfzMdrQ=;
        b=FO5c9Qh5P5DfzvjTdzuyCAoF2eGca9ZtubsWavsiYb0JIlRRj1JABx6vuPkvwbY8AO
         aM+BwxrADzaJVoicAnB5YFBpNlCtqD/Ut97d26SfkX29ziLaTAHi/eqWpNPmdSOYmnDM
         dhitEaQz/8q6QR2alvVUVRiTodcU0rfhJktG1bn+WcveG3pxWl60wd4aUuGKtAA8BrJV
         ntj66wOjFw7tjFA+BHJQZlP55ugZ44ffTu6FeFmZT6KurDhJTNZCAK95+W9A3ey497v+
         U3yaMnQJX0qAA9ZbTW3rd/X3NniY3b64CTiW8ppPXPdxK8wGmKOn+HOsATd71t7VZldO
         mdTw==
X-Gm-Message-State: ANoB5pnqtcZQj7GxBRrtlrUIg3eL167LG/zq1qSFiblbc4NP9yY4rUUb
        Rh9WDJ7gq5iQxuNYf1vR0C5cYcSHnlXw2Q==
X-Google-Smtp-Source: AA0mqf5EX/WmGikAtKQZ7TRWlLI1OtFhz/Ihzv88CGw0ULQ27zs1mj0qbxCz+yyj4AXj3lwlwGyO3w==
X-Received: by 2002:a17:902:ce04:b0:187:3a54:9b93 with SMTP id k4-20020a170902ce0400b001873a549b93mr8785475plg.2.1669057894040;
        Mon, 21 Nov 2022 11:11:34 -0800 (PST)
Received: from chromium.org (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id n15-20020a170902e54f00b0017f73dc1549sm10176867plf.263.2022.11.21.11.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 11:11:33 -0800 (PST)
Date:   Mon, 21 Nov 2022 19:11:32 +0000
From:   Prashant Malani <pmalani@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH] usb: typec: pd: Add symlink to linked device
Message-ID: <Y3vNZEuNI3CWzZ0L@chromium.org>
References: <20221121062106.2569297-1-pmalani@chromium.org>
 <Y3scND+8DVe8SGeD@kroah.com>
 <Y3sls9+NcQrdjb9y@chromium.org>
 <Y3sql/3xgXvre6rT@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3sql/3xgXvre6rT@kroah.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Nov 21 08:36, Greg Kroah-Hartman wrote:
> On Mon, Nov 21, 2022 at 07:16:03AM +0000, Prashant Malani wrote:
> > On Nov 21 07:35, Greg Kroah-Hartman wrote:
> > > On Mon, Nov 21, 2022 at 06:20:39AM +0000, Prashant Malani wrote:
> 
> Why either?  What exactly is this "device" that you are trying to link
> to?  And why not just use the real device symlink instead?

It's the Type-C port partner device, created here [1]

> > 
> > > 
> > > What in userspace wants to see this symlink?
> > 
> > ChromeOS's userspace Type-C daemon. It listens for Type-C partner uevents, but the PD objects
> > can be created later (and destroyed and then recreated again, for PD chargers which dynamically
> > change their source caps), and this helps determine which partner does those events apply to.
> 
> Then set up the proper device symlink like the driver model supports,
> then you don't have to create a new one, and you don't have to add the
> documentation entry as it's implied.

Sounds good. I'll submit a new series (or single patch) which follows this approach.

Thanks again!

-Prashant

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tree/drivers/usb/typec/class.c?h=usb-next#n885
