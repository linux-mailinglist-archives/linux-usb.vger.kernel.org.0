Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACA1F6A005B
	for <lists+linux-usb@lfdr.de>; Thu, 23 Feb 2023 02:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232463AbjBWBAe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Feb 2023 20:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjBWBAd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Feb 2023 20:00:33 -0500
X-Greylist: delayed 583 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Feb 2023 16:59:49 PST
Received: from nxs.re (nxs.re [136.243.78.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265EC41B53
        for <linux-usb@vger.kernel.org>; Wed, 22 Feb 2023 16:59:49 -0800 (PST)
Message-ID: <a5ff3baf-7d9c-48f6-fc18-d8fae321bc3a@nxs.re>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxs.re; s=dkim;
        t=1677113401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=iiyzB+oTuV0F+9RchMucxB4ypLmRwnzK9t1fAKkPDeA=;
        b=hxoRrtpFPzi9owXjyAplttQNkJPMJ1n3OMJfFRIy60iYTIjBGWVEaXrjoMIxOQuoJ3A6z5
        mlb+27/CbHvd2XjSewPJ1BQs4tonAAI5KXqcytqj171H2WX6BtwwwQ+eWvEi/CnphVDr6k
        0u/DQsaCxV/Uvzkcdhxq9iaEvSFfIulGHzSk+ZhWJwlmqNHVofF2vb1DH7uHl1gl2af5o/
        Fsy5ftMYdhxIvxB3QM4LyykUl2RsxOSaNbmLciXlniJnqLOFyXzMVZc8gtMBW4p1lI/jIV
        ETUlvsg3XQ6ewQMIiwl3OycG8yKB9l6F8Ll1htnO3JP8K2uGN6OGhrtS8/FDAw==
Authentication-Results: nxs.re;
        auth=pass smtp.mailfrom=n@nxs.re
Date:   Thu, 23 Feb 2023 01:50:00 +0100
MIME-Version: 1.0
Content-Language: en-US
From:   Marian <n@nxs.re>
To:     linux-usb@vger.kernel.org
Subject: Class-specific interfaces in FunctionFS gadget
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: /
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I am currently trying to implement a more complex USB UAC2 audio device 
than the one provided by `f_uac2` using the FunctionFS gadget `f_fs`. 
However, as far as I can tell, this currently won't work because 
FunctionFS parses the supplied descriptors in `ffs_do_single_desc`, 
which does not handle any class-specific interfaces. Adding support 
there is also non-trivial because of the relatively large number of 
descriptor (sub)types that would need to be parsed and handled just for 
UAC1 and 2 alone. As I understand it (correct me if I'm wrong), 
FunctionFS needs to parse them to make the descriptors "relocatable", 
i.e. support offsetting interface, endpoint and string references once 
the USB gadget is actually initialized in case there are other functions 
in the configuration, making this parsing essential for the gadget to work.

I was wondering what the best option to support more/any descriptors in 
FunctionFS would be or if I'm missing something. Would it not be better 
to have the user of `f_fs` (optionally) supply a sort of "relocation 
table" containing (byte_offset, entity_type) entries alongside the 
already supplied descriptor and string blobs? This could be used as an 
alternative to

Unrelated to that, it does currently support interface association 
descriptors, but ignores `bFirstInterface`. Is this correct? If an 
`f_fs` instance would e.g. start at interface number 3, 
`bFirstInterface` should be offset by 3, no?

Best regards,
Marian

