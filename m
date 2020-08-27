Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599D4255006
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 22:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgH0U3l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 16:29:41 -0400
Received: from smtprelay0135.hostedemail.com ([216.40.44.135]:54372 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726147AbgH0U3l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Aug 2020 16:29:41 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 2BD4F181D302B;
        Thu, 27 Aug 2020 20:29:40 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:2:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1535:1593:1594:1605:1730:1747:1777:1792:1801:2194:2199:2393:2553:2559:2562:2828:2893:2894:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4049:4119:4250:4321:4605:5007:6117:6119:6247:6691:7903:8603:8660:9040:9149:10004:10848:11026:11232:11473:11658:11914:12043:12296:12297:12663:12679:12740:12760:12895:13148:13153:13228:13230:13439:14659:21080:21324:21433:21451:21627:21939:21990:30012:30029:30034:30054:30070:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:1:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: brass22_380a74227070
X-Filterd-Recvd-Size: 8107
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf11.hostedemail.com (Postfix) with ESMTPA;
        Thu, 27 Aug 2020 20:29:37 +0000 (UTC)
Message-ID: <cf9b1ea3716305447be43bffc8f90b7ef7292f5b.camel@perches.com>
Subject: Re: [Cocci] [PATCH] usb: atm: don't use snprintf() for sysfs attrs
From:   Joe Perches <joe@perches.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        cocci <cocci@systeme.lip6.fr>, Kees Cook <keescook@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        accessrunner-general@lists.sourceforge.net
Date:   Thu, 27 Aug 2020 13:29:36 -0700
In-Reply-To: <alpine.DEB.2.22.394.2008272141220.2482@hadrien>
References: <20200824222322.22962-1-alex.dewar90@gmail.com>
         <48f2dc90-7852-eaf1-55d7-2c85cf954688@rasmusvillemoes.dk>
         <20200827071537.GA168593@kroah.com>
         <20200827131819.7rcl2f5js3hkoqj2@lenovo-laptop>
         <def24e9e-018c-9712-0d07-d4cbc84f07d9@rasmusvillemoes.dk>
         <20200827144846.yauuttjaqtxaldxg@lenovo-laptop>
         <5d1dfb9b031130d4d20763ec621233a19d6a88a2.camel@perches.com>
         <alpine.DEB.2.22.394.2008272141220.2482@hadrien>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-08-27 at 21:42 +0200, Julia Lawall wrote:
> 
> On Thu, 27 Aug 2020, Joe Perches wrote:
> 
> > On Thu, 2020-08-27 at 15:48 +0100, Alex Dewar wrote:
> > > On Thu, Aug 27, 2020 at 03:41:06PM +0200, Rasmus Villemoes wrote:
> > > > On 27/08/2020 15.18, Alex Dewar wrote:
> > > > > On Thu, Aug 27, 2020 at 09:15:37AM +0200, Greg Kroah-Hartman wrote:
> > > > > > On Thu, Aug 27, 2020 at 08:42:06AM +0200, Rasmus Villemoes wrote:
> > > > > > > On 25/08/2020 00.23, Alex Dewar wrote:
> > > > > > > > kernel/cpu.c: don't use snprintf() for sysfs attrs
> > > > > > > > 
> > > > > > > > As per the documentation (Documentation/filesystems/sysfs.rst),
> > > > > > > > snprintf() should not be used for formatting values returned by sysfs.
> > > > > > > > 
> > > > > > > 
> > > > > > > Can we have a sysfs_sprintf() (could just be a macro that does sprintf)
> > > > > > > to make it clear to the next reader that we know we're in a sysfs show
> > > > > > > method? It would make auditing uses of sprintf() much easier.
> > > > > > 
> > > > > > Code churn to keep code checkers quiet for pointless reasons?  What
> > > > > > could go wrong with that...
> > > > 
> > > > I did not (mean to) suggest replacing existing sprintf() calls in sysfs
> > > > show methods. But when changes _are_ being made, such as when replacing
> > > > snprintf() calls for whatever reasons, can we please not make it harder
> > > > for people doing manual audits (those are "code checkers" as well, I
> > > > suppose, but they do tend to only make noise when finding something).
> > > > 
> > > > > > It should be pretty obvious to any reader that you are in a sysfs show
> > > > > > method, as almost all of them are trivially tiny and obvious.
> > > > 
> > > > git grep doesn't immediately show that, not even with a suitable -C
> > > > argument, as you can't really know the potential callers unless you open
> > > > the file and see that the function is only assigned as a .show method.
> > > > And even that can be a pain because it's all hidden behind five levels
> > > > of magic macros that build identifiers with ##.
> > > > 
> > > > > Perhaps I should have mentioned this in the commit message, but the problem
> > > > > is that snprintf() doesn't return the number of bytes written to the
> > > > > destination buffer,
> > > > 
> > > > I'm perfectly well aware of that, TYVM (you may want to 'git log
> > > > --author Villemoes lib/vsprintf.c').
> > > > 
> > > >  but the number of bytes that *would have been written if
> > > > > they fitted*, which may be more than the bounds specified [1]. So "return
> > > > > snprintf(...)" for sysfs attributes is an antipattern. If you need bounded
> > > > > string ops, scnprintf() is the way to go. Using snprintf() can give a
> > > > > false sense of security, because it isn't necessarily safe.
> > > > 
> > > > Huh? This all seems utterly irrelevant WRT a change that replaces
> > > > PAGE_SIZE by INT_MAX (because that's what sprintf() is going to pretend
> > > > you passed). You get the same return value.
> > > > 
> > > > But I'm not at all concerned about whether one passes the proper buffer
> > > > size or not in sysfs show methods; with my embedded hat on, I'm all for
> > > > saving a few bytes of .text here and there. The problem, as far as I'm
> > > > concerned, is merely that adding sprintf() callers makes it harder to
> > > > find the problematic sprintf() instances.
> > > > 
> > > 
> > > Apologies, I think I might have expressed myself poorly, being a kernel noob
> > > ;-). I know that this is a stylistic change rather than a functional
> > > one -- I meant that I was hoping that it would be helpful to get rid of bad
> > > uses of snprintf().
> > > 
> > > I really like your idea of helper methods though :-). If in show()
> > > methods we could have something like:
> > > 	return sysfs_itoa(buf, i);
> > > in place of:
> > > 	return sprintf(buf, "%d\n", i);
> > > 
> > > ... then we wouldn't be introducing any new calls to sprintf() as you
> > > say, but we'd still be removing a call to snprintf() (which also may be
> > > problematic). Plus we'd have type checking on the argument.
> > > 
> > > For returning strings, we could have a bounded and unbounded variant of
> > > the function. As it seems like only single values should be returned via
> > > sysfs, if we did things this way then it would only be these
> > > string-returning functions which could cause buffer overflow problems
> > > and kernel devs could focus their attention accordingly...
> > > 
> > > What do people think? I'm happy to have a crack, provided this is
> > > actually a sensible thing to do! I'm looking for a newbie-level project
> > > to get started with.
> > 
> > Not a bad idea.
> > 
> > Coccinelle should be able to transform the various .show
> > methods to something sysfs_ prefixed in a fairly automated
> > way.
> 
> Something like
> 
> identifier f;
> fresh identifier = "sysfs" ## f;
> 
> may be useful.  Let me know if further help is needed.

Perhaps it's a bit more complicated.

Perhaps what's necessary is to find any
appropriate .show function and change
any use of strcpy/sprintf within those
function to some other name.

For instance:

drivers/isdn/mISDN/core.c-static ssize_t name_show(struct device *dev,
drivers/isdn/mISDN/core.c-                       struct device_attribute *attr, char *buf)
drivers/isdn/mISDN/core.c-{
drivers/isdn/mISDN/core.c:      strcpy(buf, dev_name(dev));
drivers/isdn/mISDN/core.c-      return strlen(buf);
drivers/isdn/mISDN/core.c-}
drivers/isdn/mISDN/core.c-static DEVICE_ATTR_RO(name);

and macroized uses like:

drivers/base/node.c-#define CACHE_ATTR(name, fmt)                                               \
drivers/base/node.c-static ssize_t name##_show(struct device *dev,                              \
drivers/base/node.c-                       struct device_attribute *attr,               \
drivers/base/node.c-                       char *buf)                                   \
drivers/base/node.c-{                                                                   \
drivers/base/node.c-    return sprintf(buf, fmt "\n", to_cache_info(dev)->cache_attrs.name);\
drivers/base/node.c-}                                                                   \
drivers/base/node.c:DEVICE_ATTR_RO(name);
drivers/base/node.c-
drivers/base/node.c-CACHE_ATTR(size, "%llu")
drivers/base/node.c-CACHE_ATTR(line_size, "%u")
drivers/base/node.c-CACHE_ATTR(indexing, "%u")
drivers/base/node.c-CACHE_ATTR(write_policy, "%u")

