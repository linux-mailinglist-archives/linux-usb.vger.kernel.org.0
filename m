Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C207EAC72
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2019 10:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbfJaJPy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Oct 2019 05:15:54 -0400
Received: from cable.insite.cz ([84.242.75.189]:53435 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726867AbfJaJPy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 31 Oct 2019 05:15:54 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id A6913A1A40B04;
        Thu, 31 Oct 2019 10:15:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1572513351; bh=jVf53xg+1jPqrDVuI37m3bfDrLWcQxSsICGJ3eSKFfc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GU6adu+pU7oe3kxQikLxUzudydtZ6JT2pP0NOmvS5xkClh1Se449ejzXRcsvNL7Td
         58xAOxriUCBf9JTiYKPnjdGm9OBQ7zaWDuMU+ppE/rbLCVUAoPZ9THJ8jKERPbYnnG
         t3oPhCF1DUZ6o61WA4Iu2eYG4AaElm525FH7mJVI=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1VGeLMrkUyMn; Thu, 31 Oct 2019 10:15:51 +0100 (CET)
Received: from [192.168.100.32] (unknown [192.168.100.32])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 83EC1A1A40B02;
        Thu, 31 Oct 2019 10:15:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1572513351; bh=jVf53xg+1jPqrDVuI37m3bfDrLWcQxSsICGJ3eSKFfc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GU6adu+pU7oe3kxQikLxUzudydtZ6JT2pP0NOmvS5xkClh1Se449ejzXRcsvNL7Td
         58xAOxriUCBf9JTiYKPnjdGm9OBQ7zaWDuMU+ppE/rbLCVUAoPZ9THJ8jKERPbYnnG
         t3oPhCF1DUZ6o61WA4Iu2eYG4AaElm525FH7mJVI=
Subject: Re: [PATCH] usb: dwc3: gadget: fix race when disabling ep with
 cancelled xfers
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Linux USB <linux-usb@vger.kernel.org>,
        Roger Quadros <rogerq@ti.com>
References: <20191031090713.1452818-1-felipe.balbi@linux.intel.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <3cd8a46e-8c1a-84c1-eb82-27713cf16a87@ivitera.com>
Date:   Thu, 31 Oct 2019 10:15:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191031090713.1452818-1-felipe.balbi@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Dne 31. 10. 19 v 10:07 Felipe Balbi napsal(a):
> When disabling an endpoint which has cancelled requests, we should
> make sure to giveback requests that are currently pending in the
> cancelled list, otherwise we may fall into a situation where command
> completion interrupt fires after endpoint has been disabled, therefore
> causing a splat.
> 

Please is this problem (and its solution) also applicable to dwc2 (i.e. 
e.g. RPi4)?

Thanks a lot,

Pavel.
