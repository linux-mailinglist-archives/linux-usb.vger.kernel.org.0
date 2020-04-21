Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573491B230A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2020 11:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgDUJlG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Apr 2020 05:41:06 -0400
Received: from ironboyv.h-da.de ([141.100.10.230]:47879 "EHLO ironboyv.h-da.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbgDUJlF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Apr 2020 05:41:05 -0400
X-Greylist: delayed 603 seconds by postgrey-1.27 at vger.kernel.org; Tue, 21 Apr 2020 05:41:05 EDT
IronPort-SDR: RNWaWLtnTQKCZWdrrZ0LLreZ9METvb74/DeQtd+23ckPa27NTjjU3GlrpiW+Nq/sZ2wCXb8Fde
 n0hcf9/InPzJvcF6Zhb54z27VRy42AXq3ndqWLwMfkTnzojBKjIUG4tILA9fsFS12IuF6WdZqn
 JdIE0PKyIcCvW5WOYNGiGB59+/Cid9l2w5D5uNg0EqYqHH1UHE5lPnUyVtnXFa8Hk3T84JA3en
 bv0HW+9h2DysP6A3JuBRzmIMZjaLYPfiRw0ODjkKlOmNqSlv85ujAvewSxpHuzDUcfGlrhQnRZ
 qlg=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2G4EgA8vJ5e/2soZI1mHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgXuCKi1CUiAShEiOf04BAQEBAQEFAYEKCCEBg3SPX4YagWcKAQE?=
 =?us-ascii?q?BIRwEAQGEOgoCghUkOBMCAwEBAQMCBQEBBgEBAQEBAQQEAgJpBAEBBwoCAYR?=
 =?us-ascii?q?OIQEDBwoBQ4ZHBiMPAUYQCw0NAh8HAgJXBgEMCAEBgyKCWCmxB4EyGgKKVoE?=
 =?us-ascii?q?OKow5GnmBB4E4DIIvLj6ENYMrgl8EsgiBUnyXbCOCRQGNJwUUA4xUi2qECZ8?=
 =?us-ascii?q?AIymBLU0kFIMlTxiSHY4TP496AQE?=
X-IPAS-Result: =?us-ascii?q?A2G4EgA8vJ5e/2soZI1mHAEBAQEBBwEBEQEEBAEBgXuCK?=
 =?us-ascii?q?i1CUiAShEiOf04BAQEBAQEFAYEKCCEBg3SPX4YagWcKAQEBIRwEAQGEOgoCg?=
 =?us-ascii?q?hUkOBMCAwEBAQMCBQEBBgEBAQEBAQQEAgJpBAEBBwoCAYROIQEDBwoBQ4ZHB?=
 =?us-ascii?q?iMPAUYQCw0NAh8HAgJXBgEMCAEBgyKCWCmxB4EyGgKKVoEOKow5GnmBB4E4D?=
 =?us-ascii?q?IIvLj6ENYMrgl8EsgiBUnyXbCOCRQGNJwUUA4xUi2qECZ8AIymBLU0kFIMlT?=
 =?us-ascii?q?xiSHY4TP496AQE?=
Received: from unknown (HELO mail.fbihome.de) ([141.100.40.107])
  by ironboyv.h-da.de with ESMTP; 21 Apr 2020 11:31:00 +0200
Received: from [192.168.178.31] (x5f721447.dyn.telefonica.de [95.114.20.71])
        by mail.fbihome.de (Postfix) with ESMTPSA id CDBE242197;
        Tue, 21 Apr 2020 11:30:58 +0200 (CEST)
Subject: Re: [PROBLEM]: Infinite warm reset loops resulting in "Cannot enable.
 Maybe the USB cable is bad?" messages
To:     Matthew Ruffell <matthew.ruffell@canonical.com>,
        linux-usb@vger.kernel.org
Cc:     dann.frazier@canonical.com, heitor.de.siqueira@canonical.com
References: <cd36bf27-fc7b-9a22-7065-2fabb8e89674@canonical.com>
From:   Jan-Marek Glogowski <glogow@fbihome.de>
Autocrypt: addr=glogow@fbihome.de; keydata=
 mQGiBEDrcVsRBACdQcj/8k2CSP+5frReJ2y7AAs4+3nBKPg08yOAsdcyQJAPbRGO8r1wJ6lb
 fnJI8+y8uvmsdQ83P4262EqpShHCpI7ioPUopkAKW5dWp/NM+YjYK0m3kMI03HlHeHKAMjyc
 pUmFu0sHktbDwrDUxTksgkcRHU1bbcyVuR7yaPbpdwCgoUn/Fthp7RItKuCLktKop6BcQbsE
 AIXM5gjo5C6l7I2tXFuO1+4boEwmL2WnGFEawFB4gBaBBJ6zUHzikdZW/5WHCUalSKRd38Bi
 PW2buoftYwIjuoRj30+YEVZ/2/oZsREcIazUeZzXaP2Emr/2rRNugj5KDPfgh6v6F9+Ravkw
 z6Bixv1lti7DoP32c7oDwggJEH6LA/0UVRt4RL3gO5Dcz+KIwOVrviZCKYB6/XSMfoAUDwne
 KhnYeQCB2ylV4O/bMrHz3dkNKHfgZ6SbMFJdAmCD1Vey0819jsh/CLCz9vp2wr5IzpTanL7y
 XYjj9R/qpDaW00LZF3+Maqavi3JKAi7K0CjnbcVfV65Rm/Qs1cfrsKQTf7QnSmFuLU1hcmVr
 IEdsb2dvd3NraSA8Z2xvZ293QGZiaWhvbWUuZGU+iFsEExECABsFAkDrcVsGCwkIBwMCAxUC
 AwMWAgECHgECF4AACgkQj6MK58wZA3cK/gCfb8IUFtgcxPSuAH1w8hn4C5WuSsUAn1P1Amys
 nLextO0t3xDDrFWO3PFhuQENBEDrcV0QBADpsD+yR9/1FEKKDGq7Q+jyz7or/SEwuCG/kHk3
 G+ynZYQzFEQ0cWBw0QFzNUNnwVAvG22M0UDjBn8v7BBH0ZtlrqVRUx++6uVv5dlj1uuBp1gp
 cpAHSQgmcXxN4xYSwdJ7fPbMeAkf+8IZc99xG2geF3uZNwzPxVFBHhP7zIZqIwADBQP8D5PU
 ZfoGLr3lDFqhoj6Z6sz9wrqWBC0+zjFcCBaoK4C9x7wxIyBJVRe+yhucLlxQt+LrrU9uQjlT
 YeHqkIL96Xp3KN4y2pr98bzMEF6uIifTEpZs+D+Jq1VvUiJiVUnw0EuCTzmds7tm9CMkOXcH
 hs7GRsJSHXRSWqsXZUec3muIRgQYEQIABgUCQOtxXQAKCRCPowrnzBkDd02+AJ0caVX6EEut
 2yzgPx9/lndIHGYlhgCfXy/f9ENFxfAxMlLXjTvDUe9qye8=
Message-ID: <fa0fff76-dad1-1322-c9c8-fed8f47c8f6a@fbihome.de>
Date:   Tue, 21 Apr 2020 11:30:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cd36bf27-fc7b-9a22-7065-2fabb8e89674@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

this was the only time I had to work on a kernel USB problem, so can't
really help with knowledge of the USB subsystem.

And unfortunately I don't have access to that hardware anymore. I've
pinged some people, who might be able to get a hand on it again and then
can verify a new patch to prevent the original bug from reappearing, but
that's not up to me to decide.

ATB

Jan-Marek
