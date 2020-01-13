Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9468513956E
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 17:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbgAMQEn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 11:04:43 -0500
Received: from mail-lj1-f171.google.com ([209.85.208.171]:44845 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgAMQEm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 11:04:42 -0500
Received: by mail-lj1-f171.google.com with SMTP id u71so10653980lje.11
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2020 08:04:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l4fjAZTpTf0tcx4gXNPK7iV5jfHPr0pV3Z/M1vtvTiY=;
        b=j0tHwCUNCma5FiGc8g2ntIVDiFuj/I/vYSeecce2Jg/eE9mrGBGr4jW5YKkIlHCBId
         xCgD2jCFlW2apjphUAWBE7W78DKbL5eG2Mjz1bRN7rNGJ7eILGl24UdxZpi4F6Mts/NG
         auBbrtARmX1TCheWDlCgZISQchWVlt2FhXEN5vWjN1KfLP5gQKCcFs0tpx9qDMFy0y/x
         clhXWAC12u+2GsoU9Gip3LvF1yQxsTgr10NveRDuUqLYXBngH4Fv2S8sGqN6x0tRGafW
         eE9NwGUUOAWE/6TxMDpuNVGYCVxfCV/gMGTsnVnpfk+YctbWsR3lI81tI4kE/9WL4i/O
         RESw==
X-Gm-Message-State: APjAAAUKyQXojliLBMakugOIIcUohyT1mT5D0Vs3gm609gdPBrTq9rPR
        TkNhPXwcNs11AqnWHFvvd90=
X-Google-Smtp-Source: APXvYqy0z/mNFb/vSeqt+4kBJUs7IDaznYdFNbAes+PdnSO51C/bOgXxig5sKvnEixxYuJVDxlK/Fg==
X-Received: by 2002:a2e:b60d:: with SMTP id r13mr11512407ljn.40.1578931480636;
        Mon, 13 Jan 2020 08:04:40 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id 204sm5926440lfj.47.2020.01.13.08.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 08:04:38 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1ir2Ck-0001CH-JN; Mon, 13 Jan 2020 17:04:38 +0100
Date:   Mon, 13 Jan 2020 17:04:38 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Kristian Evensen <kristian.evensen@gmail.com>
Cc:     linux-usb@vger.kernel.org, johan@kernel.org
Subject: Re: [PATCH] USB: serial: option: Add support for Quectel RM500Q
Message-ID: <20200113160438.GE2301@localhost>
References: <20200113141405.32267-1-kristian.evensen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113141405.32267-1-kristian.evensen@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 13, 2020 at 03:14:05PM +0100, Kristian Evensen wrote:
> RM500Q is a 5G module from Quectel, supporting both standalone and
> non-standalone modes. Unlike other recent Quectel modems, it is possible
> to identify the diagnostic interface (bInterfaceProtocol is unique).
> Thus, there is no need to check for the number of endpoints or reserve
> interfaces. The interface number is still dynamic though, so matching on
> interface number is not possible and two entries have to be added to the
> table.

Applied, thanks.

Johan
